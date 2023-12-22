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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_e28f]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_0918]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_ce2f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l470_c11_5caa]
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_d122]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_0918]
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l470_c7_0918]
signal t8_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_0918]
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l470_c7_0918]
signal dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l470_c7_0918]
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_0918]
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_0918]
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_0918]
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_0918]
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l471_c30_0e42]
signal sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c9_52c6]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l475_c9_e636]
signal MUX_uxn_opcodes_h_l475_c9_e636_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_e636_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_e636_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_e636_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_abc3]
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l476_c15_248b]
signal MUX_uxn_opcodes_h_l476_c15_248b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_248b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_248b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_248b_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_70fd]
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l477_c29_f1b2]
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l477_c8_dc62]
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_5292]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_ced5]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_ced5]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c3_ced5]
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_ced5]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_ced5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_ced5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c3_ced5]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_ced5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_ced5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_ced5]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_ced5]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l478_c23_41bd]
signal device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_41bd_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_41bd_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_41bd_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_8273]
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l482_c9_3b7c]
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_2b83]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_2b83]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_5356]
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_8049]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_2363]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_2363]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_2363]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_2363]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_2363]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l488_c8_2363]
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_2363]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_46f2]
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_1eb5]
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_1eb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_1eb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_1eb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c8_1eb5]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_62ed( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_stack_index_flipped := ref_toks_10;
      base.is_pc_updated := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f
BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_ce2f
t8_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f
dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f
device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f
result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa
BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- t8_MUX_uxn_opcodes_h_l470_c7_0918
t8_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l470_c7_0918_cond,
t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- dei_param_MUX_uxn_opcodes_h_l470_c7_0918
dei_param_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond,
dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l470_c7_0918
device_in_result_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond,
device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918
result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output);

-- sp_relative_shift_uxn_opcodes_h_l471_c30_0e42
sp_relative_shift_uxn_opcodes_h_l471_c30_0e42 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins,
sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x,
sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y,
sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6
BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output);

-- MUX_uxn_opcodes_h_l475_c9_e636
MUX_uxn_opcodes_h_l475_c9_e636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l475_c9_e636_cond,
MUX_uxn_opcodes_h_l475_c9_e636_iftrue,
MUX_uxn_opcodes_h_l475_c9_e636_iffalse,
MUX_uxn_opcodes_h_l475_c9_e636_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output);

-- MUX_uxn_opcodes_h_l476_c15_248b
MUX_uxn_opcodes_h_l476_c15_248b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l476_c15_248b_cond,
MUX_uxn_opcodes_h_l476_c15_248b_iftrue,
MUX_uxn_opcodes_h_l476_c15_248b_iffalse,
MUX_uxn_opcodes_h_l476_c15_248b_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr,
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2
BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left,
BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right,
BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62
BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left,
BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right,
BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5
device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5
result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output);

-- device_in_uxn_opcodes_h_l478_c23_41bd
device_in_uxn_opcodes_h_l478_c23_41bd : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l478_c23_41bd_device_address,
device_in_uxn_opcodes_h_l478_c23_41bd_phase,
device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read,
device_in_uxn_opcodes_h_l478_c23_41bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c
BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left,
BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right,
BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363
result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr,
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5
result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output,
 sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output,
 MUX_uxn_opcodes_h_l475_c9_e636_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output,
 MUX_uxn_opcodes_h_l476_c15_248b_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output,
 device_in_uxn_opcodes_h_l478_c23_41bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_ce2f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_aef9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_dce2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l458_c3_7f12 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_9397 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_e636_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_e636_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_e636_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_e636_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_248b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_248b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_248b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_248b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l481_c4_42dc : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_41bd_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_41bd_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_41bd_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_cb09_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_a1f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l489_c4_fbf5 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_1878 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_5df8_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_9d4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_c88f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ed_uxn_opcodes_h_l506_l444_DUPLICATE_da0f_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_a1f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_a1f8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l458_c3_7f12 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l458_c3_7f12;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_dce2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_dce2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_aef9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_aef9;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l489_c4_fbf5 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l489_c4_fbf5;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_9397 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_9397;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_1878 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_1878;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_41bd_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l476_c15_248b_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_e636_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_e636_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l475_c9_52c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_8273] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_left;
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output := BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output := result.is_pc_updated;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l471_c30_0e42] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_ins;
     sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_x;
     sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output := sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d_return_output := result.device_ram_address;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l470_c11_5caa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_left;
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output := BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12_return_output := result.stack_address_sp_offset;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_ce2f_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_e28f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_8049] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_46f2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output := UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_c88f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_c88f_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_5df8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_5df8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output := result.u8_value;

     -- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_70fd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output := UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_e28f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_5caa_return_output;
     VAR_MUX_uxn_opcodes_h_l475_c9_e636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_52c6_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l481_c4_42dc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_8273_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_f065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_5df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_5df8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_1b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_c88f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_c88f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_9f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_b512_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_70fd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8049_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_46f2_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_eafa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_0e42_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l481_c4_42dc;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_1eb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_1eb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- MUX[uxn_opcodes_h_l475_c9_e636] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l475_c9_e636_cond <= VAR_MUX_uxn_opcodes_h_l475_c9_e636_cond;
     MUX_uxn_opcodes_h_l475_c9_e636_iftrue <= VAR_MUX_uxn_opcodes_h_l475_c9_e636_iftrue;
     MUX_uxn_opcodes_h_l475_c9_e636_iffalse <= VAR_MUX_uxn_opcodes_h_l475_c9_e636_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l475_c9_e636_return_output := MUX_uxn_opcodes_h_l475_c9_e636_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_1eb5] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output := has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c8_1eb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l477_c29_f1b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_left;
     BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output := BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_1eb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right := VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_f1b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left := VAR_MUX_uxn_opcodes_h_l475_c9_e636_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_248b_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_e636_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_e636_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_1eb5_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l477_c8_dc62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_left;
     BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output := BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output := result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_abc3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_2363] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_d122] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output;

     -- t8_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output := t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_dc62_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_248b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_abc3_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_d122_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_2363_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- MUX[uxn_opcodes_h_l476_c15_248b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l476_c15_248b_cond <= VAR_MUX_uxn_opcodes_h_l476_c15_248b_cond;
     MUX_uxn_opcodes_h_l476_c15_248b_iftrue <= VAR_MUX_uxn_opcodes_h_l476_c15_248b_iftrue;
     MUX_uxn_opcodes_h_l476_c15_248b_iffalse <= VAR_MUX_uxn_opcodes_h_l476_c15_248b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l476_c15_248b_return_output := MUX_uxn_opcodes_h_l476_c15_248b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_5292] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_MUX_uxn_opcodes_h_l476_c15_248b_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_41bd_device_address := VAR_MUX_uxn_opcodes_h_l476_c15_248b_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_5292_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     -- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output := has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output := dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- device_in[uxn_opcodes_h_l478_c23_41bd] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l478_c23_41bd_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l478_c23_41bd_device_address <= VAR_device_in_uxn_opcodes_h_l478_c23_41bd_device_address;
     device_in_uxn_opcodes_h_l478_c23_41bd_phase <= VAR_device_in_uxn_opcodes_h_l478_c23_41bd_phase;
     device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l478_c23_41bd_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l478_c23_41bd_return_output := device_in_uxn_opcodes_h_l478_c23_41bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output := has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output := current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_device_in_uxn_opcodes_h_l478_c23_41bd_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_9d4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_9d4f_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_41bd_return_output.is_dei_done;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l479_c32_cb09] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_cb09_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_41bd_return_output.device_ram_address;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_9d4f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_9d4f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_cb09_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c9_3b7c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output := device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_5356] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_3b7c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_5356_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_2b83] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_2b83] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_2b83_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_ced5] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_ced5_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_62ed_uxn_opcodes_h_l506_l444_DUPLICATE_da0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ed_uxn_opcodes_h_l506_l444_DUPLICATE_da0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_62ed(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_0918] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ed_uxn_opcodes_h_l506_l444_DUPLICATE_da0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_62ed_uxn_opcodes_h_l506_l444_DUPLICATE_da0f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_0918_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_ce2f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_ce2f_return_output;
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
