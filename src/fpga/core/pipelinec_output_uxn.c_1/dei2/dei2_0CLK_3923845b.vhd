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
entity dei2_0CLK_3923845b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_3923845b;
architecture arch of dei2_0CLK_3923845b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l455_c6_eeb5]
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l455_c2_4a4d]
signal t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c11_ae13]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l478_c1_b5f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l475_c7_9ee0]
signal t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l476_c30_341b]
signal sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l480_c9_c3fb]
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l480_c9_df97]
signal MUX_uxn_opcodes_h_l480_c9_df97_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_df97_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_df97_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l480_c9_df97_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l481_c35_5879]
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l481_c15_cf4e]
signal MUX_uxn_opcodes_h_l481_c15_cf4e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l481_c15_cf4e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l482_c49_33bd]
signal UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l482_c29_b9f6]
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l482_c8_0d64]
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_82c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c3_5b24]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l482_c3_5b24]
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l482_c3_5b24]
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c3_5b24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l482_c3_5b24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l482_c3_5b24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l482_c3_5b24]
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l482_c3_5b24]
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l482_c3_5b24]
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c3_5b24]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l482_c3_5b24]
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l483_c23_f255]
signal device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_f255_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_f255_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l483_c23_f255_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l486_c4_b711]
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c9_fb7e]
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l487_c4_9132]
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l487_c4_9132]
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l489_c11_0d18]
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l493_c13_3aa4]
signal UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l493_c8_c713]
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l493_c8_c713]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l493_c8_c713]
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l493_c8_c713]
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l493_c8_c713]
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l493_c8_c713]
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l493_c8_c713]
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l500_c13_eb31]
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c8_6d64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l500_c8_6d64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c8_6d64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c8_6d64]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l500_c8_6d64]
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b912( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_device_ram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5
BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d
dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d
device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d
result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- t8_MUX_uxn_opcodes_h_l455_c2_4a4d
t8_MUX_uxn_opcodes_h_l455_c2_4a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond,
t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue,
t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse,
t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13
BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output);

-- dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0
dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0
device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0
result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- t8_MUX_uxn_opcodes_h_l475_c7_9ee0
t8_MUX_uxn_opcodes_h_l475_c7_9ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond,
t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue,
t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse,
t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l476_c30_341b
sp_relative_shift_uxn_opcodes_h_l476_c30_341b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins,
sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x,
sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y,
sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb
BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left,
BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right,
BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output);

-- MUX_uxn_opcodes_h_l480_c9_df97
MUX_uxn_opcodes_h_l480_c9_df97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l480_c9_df97_cond,
MUX_uxn_opcodes_h_l480_c9_df97_iftrue,
MUX_uxn_opcodes_h_l480_c9_df97_iffalse,
MUX_uxn_opcodes_h_l480_c9_df97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left,
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right,
BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output);

-- MUX_uxn_opcodes_h_l481_c15_cf4e
MUX_uxn_opcodes_h_l481_c15_cf4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l481_c15_cf4e_cond,
MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue,
MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse,
MUX_uxn_opcodes_h_l481_c15_cf4e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr,
UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6
BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left,
BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right,
BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64
BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left,
BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right,
BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24
device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24
result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output);

-- device_in_uxn_opcodes_h_l483_c23_f255
device_in_uxn_opcodes_h_l483_c23_f255 : entity work.device_in_0CLK_6b74154c port map (
clk,
device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l483_c23_f255_device_address,
device_in_uxn_opcodes_h_l483_c23_f255_phase,
device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read,
device_in_uxn_opcodes_h_l483_c23_f255_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left,
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right,
BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e
BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left,
BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right,
BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr,
UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713
result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr,
UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64
result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output,
 dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output,
 sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output,
 MUX_uxn_opcodes_h_l480_c9_df97_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output,
 MUX_uxn_opcodes_h_l481_c15_cf4e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output,
 device_in_uxn_opcodes_h_l483_c23_f255_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_4a4d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a02f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_9f0a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l463_c3_0072 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1d72 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_df97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_df97_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_df97_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l480_c9_df97_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l486_c4_09c9 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_f255_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_f255_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l483_c23_f255_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_2154_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_740e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l494_c4_fc7e : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_1f87 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_d842_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_3f95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_4f74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b912_uxn_opcodes_h_l449_l511_DUPLICATE_9d58_return_output : opcode_result_t;
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
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1d72 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l479_c3_1d72;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l494_c4_fc7e := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l494_c4_fc7e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_740e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_740e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_1f87 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c4_1f87;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l463_c3_0072 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l463_c3_0072;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right := to_unsigned(2, 2);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_9f0a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_9f0a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a02f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l464_c3_a02f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l483_c23_f255_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l480_c9_df97_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l480_c9_df97_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := t8;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output := result.is_vram_write;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output := result.is_device_ram_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_4a4d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_4f74 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_4f74_return_output := device_in_result.dei_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l482_c49_33bd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output := UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l480_c9_c3fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l476_c30_341b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_ins;
     sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_x;
     sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output := sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l475_c11_ae13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l486_c4_b711] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_left;
     BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output := BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_d842 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_d842_return_output := result.is_stack_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l493_c13_3aa4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output := UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output := result.is_opc_done;

     -- UNARY_OP_NOT[uxn_opcodes_h_l500_c13_eb31] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output := UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l455_c6_eeb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_eeb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c11_ae13_return_output;
     VAR_MUX_uxn_opcodes_h_l480_c9_df97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c9_c3fb_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l486_c4_09c9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l486_c4_b711_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l482_l493_l475_l500_DUPLICATE_eb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_d842_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l475_l500_DUPLICATE_d842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l482_l475_l500_DUPLICATE_bf56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_4f74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l497_l502_DUPLICATE_4f74_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_l455_l475_DUPLICATE_9629_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l482_l455_l475_l500_DUPLICATE_1a31_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l482_c49_33bd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l493_c13_3aa4_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l500_c13_eb31_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l482_l487_DUPLICATE_d47d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l476_c30_341b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l486_c4_09c9;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c8_6d64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output := current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c8_6d64] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;

     -- MUX[uxn_opcodes_h_l480_c9_df97] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l480_c9_df97_cond <= VAR_MUX_uxn_opcodes_h_l480_c9_df97_cond;
     MUX_uxn_opcodes_h_l480_c9_df97_iftrue <= VAR_MUX_uxn_opcodes_h_l480_c9_df97_iftrue;
     MUX_uxn_opcodes_h_l480_c9_df97_iffalse <= VAR_MUX_uxn_opcodes_h_l480_c9_df97_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l480_c9_df97_return_output := MUX_uxn_opcodes_h_l480_c9_df97_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l500_c8_6d64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output := has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c29_b9f6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l500_c8_6d64] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output := has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c8_6d64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c29_b9f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left := VAR_MUX_uxn_opcodes_h_l480_c9_df97_return_output;
     VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse := VAR_MUX_uxn_opcodes_h_l480_c9_df97_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_MUX_uxn_opcodes_h_l480_c9_df97_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c8_6d64_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output := result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l481_c35_5879] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_left;
     BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output := BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output := has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- t8_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l482_c8_0d64] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_left;
     BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output := BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l478_c1_b5f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l493_c8_c713] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l482_c8_0d64_return_output;
     VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c35_5879_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l478_c1_b5f2_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l493_c8_c713_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- MUX[uxn_opcodes_h_l481_c15_cf4e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l481_c15_cf4e_cond <= VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_cond;
     MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue <= VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iftrue;
     MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse <= VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_return_output := MUX_uxn_opcodes_h_l481_c15_cf4e_return_output;

     -- t8_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l482_c1_82c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_return_output;
     VAR_device_in_uxn_opcodes_h_l483_c23_f255_device_address := VAR_MUX_uxn_opcodes_h_l481_c15_cf4e_return_output;
     VAR_device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l482_c1_82c7_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- device_in[uxn_opcodes_h_l483_c23_f255] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l483_c23_f255_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l483_c23_f255_device_address <= VAR_device_in_uxn_opcodes_h_l483_c23_f255_device_address;
     device_in_uxn_opcodes_h_l483_c23_f255_phase <= VAR_device_in_uxn_opcodes_h_l483_c23_f255_phase;
     device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l483_c23_f255_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l483_c23_f255_return_output := device_in_uxn_opcodes_h_l483_c23_f255_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_device_in_uxn_opcodes_h_l483_c23_f255_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_3f95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_3f95_return_output := VAR_device_in_uxn_opcodes_h_l483_c23_f255_return_output.is_dei_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l484_c32_2154] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_2154_return_output := VAR_device_in_uxn_opcodes_h_l483_c23_f255_return_output.device_ram_address;

     -- current_dei_phase_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_3f95_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l489_l487_DUPLICATE_3f95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l484_c32_2154_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l487_c9_fb7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l489_c11_0d18] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l487_c9_fb7e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l489_c11_0d18_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l487_c4_9132] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l487_c4_9132] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l487_c4_9132_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c3_5b24] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c3_5b24_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b912_uxn_opcodes_h_l449_l511_DUPLICATE_9d58 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b912_uxn_opcodes_h_l449_l511_DUPLICATE_9d58_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b912(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l475_c7_9ee0] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b912_uxn_opcodes_h_l449_l511_DUPLICATE_9d58_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b912_uxn_opcodes_h_l449_l511_DUPLICATE_9d58_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l475_c7_9ee0_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l455_c2_4a4d] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l455_c2_4a4d_return_output;
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
