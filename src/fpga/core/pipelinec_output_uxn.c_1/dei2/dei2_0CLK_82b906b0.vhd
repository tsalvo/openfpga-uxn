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
-- BIN_OP_EQ[uxn_opcodes_h_l435_c6_cf9f]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_dcc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_69e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_3d1d]
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l436_c3_46c2[uxn_opcodes_h_l436_c3_46c2]
signal printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l447_c11_0364]
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_997f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_69e6]
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_69e6]
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_69e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : signed(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_69e6]
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l447_c7_69e6]
signal t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l447_c7_69e6]
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l447_c7_69e6]
signal dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_69e6]
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_69e6]
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l450_c11_eec1]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_59cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_997f]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_997f]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_997f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output : signed(3 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_997f]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c7_997f]
signal t8_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c7_997f]
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output : device_in_result_t;

-- dei_param_MUX[uxn_opcodes_h_l450_c7_997f]
signal dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_997f]
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_997f]
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l453_c30_40a4]
signal sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_c384]
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l457_c15_33d9]
signal MUX_uxn_opcodes_h_l457_c15_33d9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_33d9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_33d9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c15_33d9_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_989b]
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l458_c29_147b]
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l458_c8_b091]
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_b78d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : device_in_result_t;

-- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_e8b3]
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);

-- device_in[uxn_opcodes_h_l459_c23_a8cc]
signal device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_a8cc_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_a8cc_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l459_c23_a8cc_return_output : device_in_result_t;

-- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_a070]
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output : unsigned(8 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l463_c9_59f8]
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_f5bd]
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_f5bd]
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output : unsigned(0 downto 0);

-- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_c9d6]
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse : unsigned(0 downto 0);
signal is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_8df1]
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_f369]
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_f369]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l469_c8_f369]
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_f369]
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_f369]
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_f369]
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(7 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_f369]
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_cc07]
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_2c03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l476_c8_2c03]
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_2c03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_2c03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);

-- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_2c03]
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
signal has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7764( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f
BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d
result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c2_3d1d
t8_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d
device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d
dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

-- printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2
printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2 : entity work.printf_uxn_opcodes_h_l436_c3_46c2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364
BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right,
BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6
result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- t8_MUX_uxn_opcodes_h_l447_c7_69e6
t8_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6
device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- dei_param_MUX_uxn_opcodes_h_l447_c7_69e6
dei_param_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1
BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f
result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c7_997f
t8_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c7_997f_cond,
t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c7_997f
device_in_result_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c7_997f
dei_param_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond,
dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l453_c30_40a4
sp_relative_shift_uxn_opcodes_h_l453_c30_40a4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins,
sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x,
sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y,
sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right,
BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output);

-- MUX_uxn_opcodes_h_l457_c15_33d9
MUX_uxn_opcodes_h_l457_c15_33d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l457_c15_33d9_cond,
MUX_uxn_opcodes_h_l457_c15_33d9_iftrue,
MUX_uxn_opcodes_h_l457_c15_33d9_iffalse,
MUX_uxn_opcodes_h_l457_c15_33d9_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr,
UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l458_c29_147b
BIN_OP_AND_uxn_opcodes_h_l458_c29_147b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left,
BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right,
BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l458_c8_b091
BIN_OP_OR_uxn_opcodes_h_l458_c8_b091 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left,
BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right,
BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3
result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3
device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output);

-- device_in_uxn_opcodes_h_l459_c23_a8cc
device_in_uxn_opcodes_h_l459_c23_a8cc : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l459_c23_a8cc_device_address,
device_in_uxn_opcodes_h_l459_c23_a8cc_phase,
device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read,
device_in_uxn_opcodes_h_l459_c23_a8cc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right,
BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8
BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left,
BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right,
BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output);

-- is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse,
is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr,
UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369
result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr,
UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03
result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output);

-- has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse,
has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr,
UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output,
 sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output,
 MUX_uxn_opcodes_h_l457_c15_33d9_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output,
 device_in_uxn_opcodes_h_l459_c23_a8cc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output,
 BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output,
 is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output,
 has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output,
 UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_0ab0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9419 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_3d1d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_b494 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_33d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c15_33d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l462_c4_cda4 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_cd76_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_136c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l470_c4_5ac0 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_ec2b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_27a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623_return_output : unsigned(3 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_ea0a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_85c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l429_l487_DUPLICATE_55a6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_136c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l472_c4_136c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_ec2b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l477_c4_ec2b;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l470_c4_5ac0 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l470_c4_5ac0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_0ab0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l442_c3_0ab0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_b494 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c3_b494;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right := to_unsigned(1, 1);
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9419 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l441_c3_9419;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := to_unsigned(1, 1);
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := has_written_to_n;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse := has_written_to_n;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left := has_written_to_t;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l457_c15_33d9_cond := is_first_dei_done;
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse := is_first_dei_done;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue := is_second_dei_done;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse := is_second_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left := t8;
     VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := t8;
     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_3d1d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c11_eec1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_27a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_27a7_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l457_c35_c384] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_left;
     BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output := BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output := UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l469_c13_8df1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output := UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output := result.is_opc_done;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_3d1d_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c6_cf9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75_return_output := result.sp_relative_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l476_c13_cc07] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output := UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l462_c4_a070] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_left;
     BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output := BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l447_c11_0364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_left;
     BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output := BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_85c8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_85c8_return_output := device_in_result.dei_value;

     -- sp_relative_shift[uxn_opcodes_h_l453_c30_40a4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_ins;
     sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_x;
     sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output := sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l458_c49_989b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output := UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c6_cf9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l447_c11_0364_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_eec1_return_output;
     VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l457_c35_c384_return_output, 8);
     VAR_current_dei_phase_uxn_opcodes_h_l462_c4_cda4 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l462_c4_a070_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l450_l435_l447_DUPLICATE_8d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l469_l458_l447_l476_l450_DUPLICATE_29dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_27a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l435_l447_DUPLICATE_27a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l450_l435_l447_l476_DUPLICATE_e970_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l450_l476_l458_DUPLICATE_3623_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_85c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l473_l478_DUPLICATE_85c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l435_l447_l458_DUPLICATE_cde4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l435_l458_l447_l476_l450_DUPLICATE_78d5_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right := VAR_UNARY_OP_NOT_uxn_opcodes_h_l458_c49_989b_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l469_c13_8df1_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l476_c13_cc07_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left := VAR_UNARY_OP_NOT_uint1_t_uxn_opcodes_h_l458_l463_DUPLICATE_80f7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l435_c2_3d1d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l435_c2_3d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l453_c30_40a4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l462_c4_cda4;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_dcc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output := t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output := current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l476_c8_2c03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l476_c8_2c03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output := result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- MUX[uxn_opcodes_h_l457_c15_33d9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l457_c15_33d9_cond <= VAR_MUX_uxn_opcodes_h_l457_c15_33d9_cond;
     MUX_uxn_opcodes_h_l457_c15_33d9_iftrue <= VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iftrue;
     MUX_uxn_opcodes_h_l457_c15_33d9_iffalse <= VAR_MUX_uxn_opcodes_h_l457_c15_33d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l457_c15_33d9_return_output := MUX_uxn_opcodes_h_l457_c15_33d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l476_c8_2c03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l476_c8_2c03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l458_c29_147b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_left;
     BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output := BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output := has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l476_c8_2c03] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output := has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right := VAR_BIN_OP_AND_uxn_opcodes_h_l458_c29_147b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_MUX_uxn_opcodes_h_l457_c15_33d9_return_output;
     VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_device_address := VAR_MUX_uxn_opcodes_h_l457_c15_33d9_return_output;
     VAR_printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_dcc4_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l476_c8_2c03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     -- t8_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output := result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l458_c8_b091] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_left;
     BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output := BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output := has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- printf_uxn_opcodes_h_l436_c3_46c2[uxn_opcodes_h_l436_c3_46c2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l436_c3_46c2_uxn_opcodes_h_l436_c3_46c2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l469_c8_f369] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output := dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond := VAR_BIN_OP_OR_uxn_opcodes_h_l458_c8_b091_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l469_c8_f369_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_59cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_59cd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output := has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l458_c1_b78d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l458_c1_b78d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- device_in[uxn_opcodes_h_l459_c23_a8cc] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l459_c23_a8cc_device_address <= VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_device_address;
     device_in_uxn_opcodes_h_l459_c23_a8cc_phase <= VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_phase;
     device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_return_output := device_in_uxn_opcodes_h_l459_c23_a8cc_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_return_output;
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_has_written_to_n_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l460_c32_cd76] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_cd76_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_return_output.device_ram_address;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_ea0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_ea0a_return_output := VAR_device_in_uxn_opcodes_h_l459_c23_a8cc_return_output.is_dei_done;

     -- device_in_result_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- has_written_to_n_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_ea0a_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l465_l463_DUPLICATE_ea0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l460_c32_cd76_return_output;
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     REG_VAR_has_written_to_n := VAR_has_written_to_n_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l465_c11_c9d6] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l463_c9_59f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_left;
     BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output := BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output;

     -- Submodule level 8
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond := VAR_BIN_OP_AND_uxn_opcodes_h_l463_c9_59f8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l465_c11_c9d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l463_c4_f5bd] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l463_c4_f5bd] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l463_c4_f5bd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l458_c3_e8b3] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l458_c3_e8b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- is_second_dei_done_MUX[uxn_opcodes_h_l450_c7_997f] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;

     -- Submodule level 11
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l450_c7_997f_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l429_l487_DUPLICATE_55a6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l429_l487_DUPLICATE_55a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7764(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output);

     -- is_first_dei_done_MUX[uxn_opcodes_h_l447_c7_69e6] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l429_l487_DUPLICATE_55a6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l429_l487_DUPLICATE_55a6_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l447_c7_69e6_return_output;
     -- is_second_dei_done_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l435_c2_3d1d] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;

     -- Submodule level 13
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
     REG_VAR_is_second_dei_done := VAR_is_second_dei_done_MUX_uxn_opcodes_h_l435_c2_3d1d_return_output;
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
