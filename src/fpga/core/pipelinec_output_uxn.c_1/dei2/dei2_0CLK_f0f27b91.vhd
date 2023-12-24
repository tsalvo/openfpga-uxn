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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_d982]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_070d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_3122]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_3122]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l450_c2_3122]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_3122]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_3122]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_3122]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_3122]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_3122]
signal t8_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_3122]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l470_c11_cc6e]
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_6f53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_070d]
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l470_c7_070d]
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l470_c7_070d]
signal dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_070d]
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_070d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_070d]
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_070d]
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l470_c7_070d]
signal t8_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_070d]
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l471_c30_6779]
signal sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l475_c9_8926]
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l475_c9_4c81]
signal MUX_uxn_opcodes_h_l475_c9_4c81_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_4c81_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_4c81_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c9_4c81_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_3655]
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l476_c15_4559]
signal MUX_uxn_opcodes_h_l476_c15_4559_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_4559_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_4559_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l476_c15_4559_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_0c6c]
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l477_c29_5f42]
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l477_c8_5d64]
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_00fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : device_in_result_t;

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_1a5c]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l478_c23_4240]
signal device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_4240_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_4240_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l478_c23_4240_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_0d30]
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l482_c9_498c]
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_600b]
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_600b]
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_2ccc]
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_8a51]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_47ed]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l488_c8_47ed]
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_47ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_47ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_47ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_47ed]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_47ed]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_bf06]
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c8_0795]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_0795]
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_0795]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_0795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_0795]
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;
      base.is_ram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_3122
device_in_result_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_3122
dei_param_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_3122
t8_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_3122_cond,
t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e
BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right,
BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l470_c7_070d
device_in_result_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond,
device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- dei_param_MUX_uxn_opcodes_h_l470_c7_070d
dei_param_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond,
dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d
result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- t8_MUX_uxn_opcodes_h_l470_c7_070d
t8_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l470_c7_070d_cond,
t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l471_c30_6779
sp_relative_shift_uxn_opcodes_h_l471_c30_6779 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins,
sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x,
sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y,
sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926
BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right,
BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output);

-- MUX_uxn_opcodes_h_l475_c9_4c81
MUX_uxn_opcodes_h_l475_c9_4c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l475_c9_4c81_cond,
MUX_uxn_opcodes_h_l475_c9_4c81_iftrue,
MUX_uxn_opcodes_h_l475_c9_4c81_iffalse,
MUX_uxn_opcodes_h_l475_c9_4c81_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right,
BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output);

-- MUX_uxn_opcodes_h_l476_c15_4559
MUX_uxn_opcodes_h_l476_c15_4559 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l476_c15_4559_cond,
MUX_uxn_opcodes_h_l476_c15_4559_iftrue,
MUX_uxn_opcodes_h_l476_c15_4559_iffalse,
MUX_uxn_opcodes_h_l476_c15_4559_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr,
UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42
BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left,
BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right,
BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64
BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left,
BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right,
BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c
device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c
result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output);

-- device_in_uxn_opcodes_h_l478_c23_4240
device_in_uxn_opcodes_h_l478_c23_4240 : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l478_c23_4240_device_address,
device_in_uxn_opcodes_h_l478_c23_4240_phase,
device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read,
device_in_uxn_opcodes_h_l478_c23_4240_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right,
BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l482_c9_498c
BIN_OP_AND_uxn_opcodes_h_l482_c9_498c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left,
BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right,
BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed
result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr,
UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795
result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output,
 sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output,
 MUX_uxn_opcodes_h_l475_c9_4c81_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output,
 MUX_uxn_opcodes_h_l476_c15_4559_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output,
 BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output,
 device_in_uxn_opcodes_h_l478_c23_4240_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output,
 BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l458_c3_16fe : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3122_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_6c69 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_0aca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_2da7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_4c81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c9_4c81_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_4559_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_4559_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_4559_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l476_c15_4559_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l481_c4_266f : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_4240_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_4240_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l478_c23_4240_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_e64c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7c18 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_1a86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_7473 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_aa9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_8e73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_5166_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8_uxn_opcodes_h_l506_l444_DUPLICATE_a184_return_output : opcode_result_t;
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
     VAR_current_dei_phase_uxn_opcodes_h_l458_c3_16fe := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l458_c3_16fe;
     VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7c18 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l489_c4_7c18;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_1a86 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c4_1a86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_0aca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_0aca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_7473 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l496_c4_7473;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_6c69 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l459_c3_6c69;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right := to_unsigned(2, 2);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse := to_unsigned(0, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_2da7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l474_c3_2da7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_4240_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l476_c15_4559_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_aa9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_aa9d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output := result.u8_value;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output := result.is_ram_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l477_c49_0c6c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output := UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l470_c11_cc6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_d982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c13_8a51] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l495_c13_bf06] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output := UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3122_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_5166 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_5166_return_output := device_in_result.dei_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l481_c4_0d30] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_left;
     BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output := BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3122_return_output := result.is_pc_updated;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output := result.is_device_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3122_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l475_c9_8926] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_left;
     BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output := BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l471_c30_6779] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_ins;
     sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_x;
     sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y <= VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output := sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d982_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l470_c11_cc6e_return_output;
     VAR_MUX_uxn_opcodes_h_l475_c9_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l475_c9_8926_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l481_c4_266f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l481_c4_0d30_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l477_l488_l470_l495_DUPLICATE_9565_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_aa9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l470_l495_DUPLICATE_aa9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l477_l470_l495_DUPLICATE_d107_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_5166_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l492_l497_DUPLICATE_5166_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l477_l450_l470_DUPLICATE_c973_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l477_l450_l470_l495_DUPLICATE_3c59_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l477_c49_0c6c_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c13_8a51_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l495_c13_bf06_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l477_l482_DUPLICATE_adde_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l471_c30_6779_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l481_c4_266f;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c8_0795] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c8_0795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c8_0795] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- MUX[uxn_opcodes_h_l475_c9_4c81] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l475_c9_4c81_cond <= VAR_MUX_uxn_opcodes_h_l475_c9_4c81_cond;
     MUX_uxn_opcodes_h_l475_c9_4c81_iftrue <= VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iftrue;
     MUX_uxn_opcodes_h_l475_c9_4c81_iffalse <= VAR_MUX_uxn_opcodes_h_l475_c9_4c81_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l475_c9_4c81_return_output := MUX_uxn_opcodes_h_l475_c9_4c81_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l495_c8_0795] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output := has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l477_c29_5f42] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_left;
     BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output := BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l495_c8_0795] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right := VAR_BIN_OP_AND_uxn_opcodes_h_l477_c29_5f42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left := VAR_MUX_uxn_opcodes_h_l475_c9_4c81_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_4559_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_4c81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_MUX_uxn_opcodes_h_l475_c9_4c81_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l495_c8_0795_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c8_0795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l495_c8_0795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c8_0795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c8_0795_return_output;
     -- t8_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output := t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l477_c8_5d64] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_left;
     BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output := BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c8_47ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l476_c35_3655] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_left;
     BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output := BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_6f53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l477_c8_5d64_return_output;
     VAR_MUX_uxn_opcodes_h_l476_c15_4559_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l476_c35_3655_return_output, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_6f53_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c8_47ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_t8_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output := t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- MUX[uxn_opcodes_h_l476_c15_4559] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l476_c15_4559_cond <= VAR_MUX_uxn_opcodes_h_l476_c15_4559_cond;
     MUX_uxn_opcodes_h_l476_c15_4559_iftrue <= VAR_MUX_uxn_opcodes_h_l476_c15_4559_iftrue;
     MUX_uxn_opcodes_h_l476_c15_4559_iffalse <= VAR_MUX_uxn_opcodes_h_l476_c15_4559_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l476_c15_4559_return_output := MUX_uxn_opcodes_h_l476_c15_4559_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_00fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_MUX_uxn_opcodes_h_l476_c15_4559_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_4240_device_address := VAR_MUX_uxn_opcodes_h_l476_c15_4559_return_output;
     VAR_device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_00fb_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output := dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output := has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output := current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output := has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- device_in[uxn_opcodes_h_l478_c23_4240] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l478_c23_4240_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l478_c23_4240_device_address <= VAR_device_in_uxn_opcodes_h_l478_c23_4240_device_address;
     device_in_uxn_opcodes_h_l478_c23_4240_phase <= VAR_device_in_uxn_opcodes_h_l478_c23_4240_phase;
     device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l478_c23_4240_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l478_c23_4240_return_output := device_in_uxn_opcodes_h_l478_c23_4240_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- Submodule level 5
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_device_in_uxn_opcodes_h_l478_c23_4240_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l479_c32_e64c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_e64c_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_4240_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_8e73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_8e73_return_output := VAR_device_in_uxn_opcodes_h_l478_c23_4240_return_output.is_dei_done;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_8e73_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l484_l482_DUPLICATE_8e73_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l479_c32_e64c_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l484_c11_2ccc] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l482_c9_498c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_left;
     BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output := BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output := device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- Submodule level 7
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l482_c9_498c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l484_c11_2ccc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l482_c4_600b] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l482_c4_600b] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- Submodule level 8
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l482_c4_600b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c3_1a5c] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;

     -- Submodule level 9
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c3_1a5c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8_uxn_opcodes_h_l506_l444_DUPLICATE_a184 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8_uxn_opcodes_h_l506_l444_DUPLICATE_a184_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3122_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3122_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l470_c7_070d] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8_uxn_opcodes_h_l506_l444_DUPLICATE_a184_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6f8_uxn_opcodes_h_l506_l444_DUPLICATE_a184_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l470_c7_070d_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_3122] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output;

     -- Submodule level 11
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c2_3122_return_output;
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
