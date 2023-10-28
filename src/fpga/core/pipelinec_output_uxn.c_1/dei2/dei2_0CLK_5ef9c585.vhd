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
-- BIN_OP_EQ[uxn_opcodes_h_l465_c6_a3a5]
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_d7fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_59fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_9d71]
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_9d71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_9d71]
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l465_c2_9d71]
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_9d71]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_9d71]
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l465_c2_9d71]
signal t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_9d71]
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l465_c2_9d71]
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l466_c3_a1de[uxn_opcodes_h_l466_c3_a1de]
signal printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l477_c11_a5dd]
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_dc09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_59fa]
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_59fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : signed(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_59fa]
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l477_c7_59fa]
signal dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_59fa]
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_59fa]
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l477_c7_59fa]
signal t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_59fa]
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l477_c7_59fa]
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l480_c11_3bef]
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_7030]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_dc09]
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_dc09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : signed(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_dc09]
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l480_c7_dc09]
signal dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_dc09]
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_dc09]
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l480_c7_dc09]
signal t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_dc09]
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l480_c7_dc09]
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l483_c30_88dc]
signal sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_efdd]
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l487_c15_cf20]
signal MUX_uxn_opcodes_h_l487_c15_cf20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_cf20_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_cf20_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l487_c15_cf20_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_4bcc]
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l488_c29_8938]
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l488_c8_1fdb]
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_343e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l488_c3_d5d8]
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : device_in_result_t;

-- device_in[uxn_opcodes_h_l489_c23_12bf]
signal device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_12bf_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_12bf_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l489_c23_12bf_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_1df4]
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l493_c9_d1e3]
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_5a04]
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_5a04]
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_9832]
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_ff32]
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_eb9c]
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_a871]
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_ad0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_ad0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c8_ad0e]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_ad0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_ad0e]
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5
BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right,
BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- dei_param_MUX_uxn_opcodes_h_l465_c2_9d71
dei_param_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- t8_MUX_uxn_opcodes_h_l465_c2_9d71
t8_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71
device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse,
device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

-- printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de
printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de : entity work.printf_uxn_opcodes_h_l466_c3_a1de_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd
BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right,
BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa
result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- dei_param_MUX_uxn_opcodes_h_l477_c7_59fa
dei_param_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- t8_MUX_uxn_opcodes_h_l477_c7_59fa
t8_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa
device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond,
device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue,
device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse,
device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef
BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right,
BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09
result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- dei_param_MUX_uxn_opcodes_h_l480_c7_dc09
dei_param_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- t8_MUX_uxn_opcodes_h_l480_c7_dc09
t8_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09
device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond,
device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue,
device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse,
device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output);

-- sp_relative_shift_uxn_opcodes_h_l483_c30_88dc
sp_relative_shift_uxn_opcodes_h_l483_c30_88dc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins,
sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x,
sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y,
sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right,
BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output);

-- MUX_uxn_opcodes_h_l487_c15_cf20
MUX_uxn_opcodes_h_l487_c15_cf20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c15_cf20_cond,
MUX_uxn_opcodes_h_l487_c15_cf20_iftrue,
MUX_uxn_opcodes_h_l487_c15_cf20_iffalse,
MUX_uxn_opcodes_h_l487_c15_cf20_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr,
UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l488_c29_8938
BIN_OP_AND_uxn_opcodes_h_l488_c29_8938 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left,
BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right,
BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb
BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left,
BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right,
BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8
result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8
device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond,
device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue,
device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse,
device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output);

-- device_in_uxn_opcodes_h_l489_c23_12bf
device_in_uxn_opcodes_h_l489_c23_12bf : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l489_c23_12bf_device_address,
device_in_uxn_opcodes_h_l489_c23_12bf_phase,
device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read,
device_in_uxn_opcodes_h_l489_c23_12bf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right,
BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3
BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left,
BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right,
BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr,
UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c
result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr,
UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e
result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output,
 sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output,
 MUX_uxn_opcodes_h_l487_c15_cf20_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output,
 BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output,
 device_in_uxn_opcodes_h_l489_c23_12bf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_7060 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l471_c3_59c0 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9d71_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_d8c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_cf20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c15_cf20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l492_c4_9915 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_12bf_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_12bf_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l489_c23_12bf_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_6589_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_87ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l500_c4_111c : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_0a32 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_0ac9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_0bf8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_ec7e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l459_l517_DUPLICATE_9e31_return_output : opcode_result_t;
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
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l500_c4_111c := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l500_c4_111c;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_d8c0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l478_c3_d8c0;
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_87ee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l502_c4_87ee;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_7060 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c3_7060;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_0a32 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c4_0a32;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l471_c3_59c0 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l471_c3_59c0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_12bf_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l487_c15_cf20_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left := t8;
     VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l477_c11_a5dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l492_c4_1df4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_0ac9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_0ac9_return_output := result.is_sp_shift;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9d71_return_output := result.is_device_ram_write;

     -- UNARY_OP_NOT[uxn_opcodes_h_l488_c49_4bcc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output := UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l465_c6_a3a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332_return_output := result.stack_address_sp_offset;

     -- UNARY_OP_NOT[uxn_opcodes_h_l499_c13_ff32] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output := UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l480_c11_3bef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_left;
     BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output := BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_ec7e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_ec7e_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102_return_output := result.sp_relative_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l506_c13_a871] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output := UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9d71_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l487_c35_efdd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l483_c30_88dc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_ins;
     sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_x;
     sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output := sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l465_c6_a3a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l477_c11_a5dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l480_c11_3bef_return_output;
     VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l487_c35_efdd_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l492_c4_9915 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l492_c4_1df4_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l480_l465_l477_DUPLICATE_f102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l499_l506_l488_l480_l477_DUPLICATE_3e91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_0ac9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l465_l477_DUPLICATE_0ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l506_l480_l465_l477_DUPLICATE_dc7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l506_l488_DUPLICATE_a332_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_ec7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l508_l503_DUPLICATE_ec7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l480_l465_l488_l477_DUPLICATE_3c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l465_l506_l488_l480_l477_DUPLICATE_7132_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l488_c49_4bcc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l499_c13_ff32_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l506_c13_a871_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l488_l493_DUPLICATE_e527_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l465_c2_9d71_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l465_c2_9d71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l483_c30_88dc_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l492_c4_9915;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l506_c8_ad0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- MUX[uxn_opcodes_h_l487_c15_cf20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c15_cf20_cond <= VAR_MUX_uxn_opcodes_h_l487_c15_cf20_cond;
     MUX_uxn_opcodes_h_l487_c15_cf20_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iftrue;
     MUX_uxn_opcodes_h_l487_c15_cf20_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c15_cf20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c15_cf20_return_output := MUX_uxn_opcodes_h_l487_c15_cf20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c8_ad0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c8_ad0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l506_c8_ad0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l488_c29_8938] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_left;
     BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output := BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l465_c1_d7fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- t8_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l506_c8_ad0e] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output := has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right := VAR_BIN_OP_AND_uxn_opcodes_h_l488_c29_8938_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_MUX_uxn_opcodes_h_l487_c15_cf20_return_output;
     VAR_device_in_uxn_opcodes_h_l489_c23_12bf_device_address := VAR_MUX_uxn_opcodes_h_l487_c15_cf20_return_output;
     VAR_printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l465_c1_d7fd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c8_ad0e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- printf_uxn_opcodes_h_l466_c3_a1de[uxn_opcodes_h_l466_c3_a1de] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l466_c3_a1de_uxn_opcodes_h_l466_c3_a1de_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l488_c8_1fdb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_left;
     BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output := BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;

     -- t8_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l499_c8_eb9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l488_c8_1fdb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l499_c8_eb9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_t8_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l485_c1_7030] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- t8_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l485_c1_7030_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l488_c1_343e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l488_c1_343e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- device_in[uxn_opcodes_h_l489_c23_12bf] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l489_c23_12bf_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l489_c23_12bf_device_address <= VAR_device_in_uxn_opcodes_h_l489_c23_12bf_device_address;
     device_in_uxn_opcodes_h_l489_c23_12bf_phase <= VAR_device_in_uxn_opcodes_h_l489_c23_12bf_phase;
     device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l489_c23_12bf_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l489_c23_12bf_return_output := device_in_uxn_opcodes_h_l489_c23_12bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_device_in_uxn_opcodes_h_l489_c23_12bf_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_0bf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_0bf8_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_12bf_return_output.is_dei_done;

     -- has_written_to_n_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l490_c32_6589] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_6589_return_output := VAR_device_in_uxn_opcodes_h_l489_c23_12bf_return_output.device_ram_address;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_0bf8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l493_l495_DUPLICATE_0bf8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l490_c32_6589_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l495_c11_9832] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l493_c9_d1e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_left;
     BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output := BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l493_c9_d1e3_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l495_c11_9832_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l493_c4_5a04] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l493_c4_5a04] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l493_c4_5a04_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l488_c3_d5d8] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l488_c3_d5d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l480_c7_dc09] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l480_c7_dc09_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l477_c7_59fa] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l459_l517_DUPLICATE_9e31 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l459_l517_DUPLICATE_9e31_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l465_c2_9d71_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l459_l517_DUPLICATE_9e31_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l459_l517_DUPLICATE_9e31_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l477_c7_59fa_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c2_9d71] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c2_9d71_return_output;
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
