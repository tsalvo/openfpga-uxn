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
entity dei2_0CLK_f0f27b91 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_f0f27b91;
architecture arch of dei2_0CLK_f0f27b91 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_6241]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_846c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_222e]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_222e]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_222e]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output : device_in_result_t;

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_222e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_222e]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_222e]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_222e]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_222e]
signal t8_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_222e]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l470_c11_8b74]
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_b97a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_846c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_846c]
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l470_c7_846c]
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output : device_in_result_t;

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_846c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l470_c7_846c]
signal dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_846c]
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_846c]
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l470_c7_846c]
signal t8_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_846c]
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l471_c30_a4df]
signal sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c9_26f1]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l475_c9_a0eb]
signal MUX_uxn_opcodes_h_l475_c9_a0eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_a0eb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_0bfa]
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l476_c15_a025]
signal MUX_uxn_opcodes_h_l476_c15_a025_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_a025_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_a025_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_a025_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_7363]
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l477_c29_68b6]
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l477_c8_f7a1]
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_9543]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_298f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_298f]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c3_298f]
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output : device_in_result_t;

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_298f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c3_298f]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_298f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_298f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_298f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_298f]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_298f]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_298f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l478_c23_a05e]
signal device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_a05e_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_a05e_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_a05e_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_332d]
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l482_c9_b134]
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_7a2a]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_7a2a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_278f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_f4cc]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_ba70]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l488_c8_ba70]
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_ba70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_ba70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_ba70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(3 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_ba70]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_ba70]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_cbd9]
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_6a2d]
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c8_6a2d]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_6a2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_6a2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_6a2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(3 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;
      base.is_vram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241
BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_222e
device_in_result_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e
result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_222e
dei_param_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_222e
t8_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_222e_cond,
t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74
BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l470_c7_846c
device_in_result_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond,
device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c
result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- dei_param_MUX_uxn_opcodes_h_l470_c7_846c
dei_param_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond,
dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- t8_MUX_uxn_opcodes_h_l470_c7_846c
t8_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l470_c7_846c_cond,
t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l471_c30_a4df
sp_relative_shift_uxn_opcodes_h_l471_c30_a4df : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins,
sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x,
sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y,
sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1
BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output);

-- MUX_uxn_opcodes_h_l475_c9_a0eb
MUX_uxn_opcodes_h_l475_c9_a0eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l475_c9_a0eb_cond,
MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue,
MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse,
MUX_uxn_opcodes_h_l475_c9_a0eb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output);

-- MUX_uxn_opcodes_h_l476_c15_a025
MUX_uxn_opcodes_h_l476_c15_a025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l476_c15_a025_cond,
MUX_uxn_opcodes_h_l476_c15_a025_iftrue,
MUX_uxn_opcodes_h_l476_c15_a025_iffalse,
MUX_uxn_opcodes_h_l476_c15_a025_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr,
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6
BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left,
BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right,
BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1
BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left,
BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right,
BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c3_298f
device_in_result_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f
result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output);

-- device_in_uxn_opcodes_h_l478_c23_a05e
device_in_uxn_opcodes_h_l478_c23_a05e : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l478_c23_a05e_device_address,
device_in_uxn_opcodes_h_l478_c23_a05e_phase,
device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read,
device_in_uxn_opcodes_h_l478_c23_a05e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c9_b134
BIN_OP_AND_uxn_opcodes_h_l482_c9_b134 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left,
BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right,
BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70
result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr,
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d
result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output,
 sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output,
 MUX_uxn_opcodes_h_l475_c9_a0eb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output,
 MUX_uxn_opcodes_h_l476_c15_a025_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output,
 BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output,
 device_in_uxn_opcodes_h_l478_c23_a05e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_222e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_9060 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_1e34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l458_c3_d41e : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_5d09 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_a025_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_a025_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_a025_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_a025_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l481_c4_cc39 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_a05e_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_a05e_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_a05e_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_6675_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_6fc8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7370 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_4f34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_8e9a_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_697d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_6188_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef_uxn_opcodes_h_l506_l444_DUPLICATE_a8b8_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_1e34 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_1e34;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l458_c3_d41e := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l458_c3_d41e;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_9060 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_9060;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_4f34 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_4f34;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7370 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7370;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_6fc8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_6fc8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_5d09 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_5d09;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_a05e_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l476_c15_a025_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := t8;
     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_222e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_222e_return_output := result.is_pc_updated;

     -- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_cbd9] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output := UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a_return_output := result.device_ram_address;

     -- sp_relative_shift[uxn_opcodes_h_l471_c30_a4df] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_ins;
     sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_x;
     sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output := sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l470_c11_8b74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_left;
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output := BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_332d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_8e9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_8e9a_return_output := result.is_stack_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_7363] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output := UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_222e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l475_c9_26f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_f4cc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_6188 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_6188_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_6241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_6241_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_8b74_return_output;
     VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_26f1_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l481_c4_cc39 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_332d_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_3979_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_8e9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_8e9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_2f4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_6188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_6188_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_cd9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b3ef_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_7363_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_f4cc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_cbd9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_449c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_a4df_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l481_c4_cc39;
     -- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_6a2d] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output := has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c8_6a2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- MUX[uxn_opcodes_h_l475_c9_a0eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l475_c9_a0eb_cond <= VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_cond;
     MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue <= VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iftrue;
     MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse <= VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_return_output := MUX_uxn_opcodes_h_l475_c9_a0eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_6a2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l477_c29_68b6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_left;
     BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output := BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_6a2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_6a2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right := VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_68b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left := VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_a025_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_a0eb_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_6a2d_return_output;
     -- t8_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output := t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_b97a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l477_c8_f7a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_left;
     BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output := BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_ba70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_0bfa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_f7a1_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_a025_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_0bfa_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_b97a_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_ba70_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output := t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- MUX[uxn_opcodes_h_l476_c15_a025] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l476_c15_a025_cond <= VAR_MUX_uxn_opcodes_h_l476_c15_a025_cond;
     MUX_uxn_opcodes_h_l476_c15_a025_iftrue <= VAR_MUX_uxn_opcodes_h_l476_c15_a025_iftrue;
     MUX_uxn_opcodes_h_l476_c15_a025_iffalse <= VAR_MUX_uxn_opcodes_h_l476_c15_a025_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l476_c15_a025_return_output := MUX_uxn_opcodes_h_l476_c15_a025_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_9543] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_MUX_uxn_opcodes_h_l476_c15_a025_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_a05e_device_address := VAR_MUX_uxn_opcodes_h_l476_c15_a025_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9543_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- device_in[uxn_opcodes_h_l478_c23_a05e] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l478_c23_a05e_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l478_c23_a05e_device_address <= VAR_device_in_uxn_opcodes_h_l478_c23_a05e_device_address;
     device_in_uxn_opcodes_h_l478_c23_a05e_phase <= VAR_device_in_uxn_opcodes_h_l478_c23_a05e_phase;
     device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l478_c23_a05e_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l478_c23_a05e_return_output := device_in_uxn_opcodes_h_l478_c23_a05e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output := dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_device_in_uxn_opcodes_h_l478_c23_a05e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l479_c32_6675] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_6675_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_a05e_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_697d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_697d_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_a05e_return_output.is_dei_done;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_697d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_697d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_6675_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_278f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c9_b134] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output := device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_b134_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_278f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_7a2a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_7a2a] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_7a2a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_298f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_298f_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_846c] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef_uxn_opcodes_h_l506_l444_DUPLICATE_a8b8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef_uxn_opcodes_h_l506_l444_DUPLICATE_a8b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_222e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_222e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef_uxn_opcodes_h_l506_l444_DUPLICATE_a8b8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c3ef_uxn_opcodes_h_l506_l444_DUPLICATE_a8b8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_846c_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_222e] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_222e_return_output;
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
