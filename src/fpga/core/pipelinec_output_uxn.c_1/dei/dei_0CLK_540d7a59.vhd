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
-- Submodules: 59
entity dei_0CLK_540d7a59 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_540d7a59;
architecture arch of dei_0CLK_540d7a59 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal has_written_to_t : unsigned(0 downto 0) := to_unsigned(0, 1);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_in_result : device_in_result_t := device_in_result_t_NULL;
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_has_written_to_t : unsigned(0 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_device_in_result : device_in_result_t;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l419_c6_d111]
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c1_e733]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l427_c7_ac29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l419_c2_1d4c]
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l420_c3_1d1d[uxn_opcodes_h_l420_c3_1d1d]
signal printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l427_c11_449c]
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_c080]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l427_c7_ac29]
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l427_c7_ac29]
signal t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l427_c7_ac29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(3 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l427_c7_ac29]
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_5035]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_593f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_c080]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l430_c7_c080]
signal t8_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_c080]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(3 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c7_c080]
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l433_c30_11f3]
signal sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l437_c8_0233]
signal UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l437_c1_f8e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(3 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l437_c3_0f3c]
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : device_in_result_t;

-- BIN_OP_MINUS[uxn_opcodes_h_l438_c37_19ee]
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l438_c23_8450]
signal device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_8450_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_8450_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_8450_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l441_c9_47ca]
signal UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l441_c4_19e3]
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l441_c4_19e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l441_c4_19e3]
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l441_c4_19e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c4_19e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111
BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left,
BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right,
BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- t8_MUX_uxn_opcodes_h_l419_c2_1d4c
t8_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c
result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c
device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond,
device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

-- printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d
printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d : entity work.printf_uxn_opcodes_h_l420_c3_1d1d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c
BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left,
BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right,
BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- t8_MUX_uxn_opcodes_h_l427_c7_ac29
t8_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29
result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29
device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond,
device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue,
device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse,
device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035
BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c7_c080
t8_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c7_c080_cond,
t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080
result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c7_c080
device_in_result_MUX_uxn_opcodes_h_l430_c7_c080 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output);

-- sp_relative_shift_uxn_opcodes_h_l433_c30_11f3
sp_relative_shift_uxn_opcodes_h_l433_c30_11f3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins,
sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x,
sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y,
sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr,
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c
result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c
device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond,
device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left,
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right,
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output);

-- device_in_uxn_opcodes_h_l438_c23_8450
device_in_uxn_opcodes_h_l438_c23_8450 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l438_c23_8450_device_address,
device_in_uxn_opcodes_h_l438_c23_8450_phase,
device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read,
device_in_uxn_opcodes_h_l438_c23_8450_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr,
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3
result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 has_written_to_t,
 t8,
 tmp8,
 device_in_result,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output,
 sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output,
 device_in_uxn_opcodes_h_l438_c23_8450_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_07f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_1d4c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_afa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_f7d9_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_8450_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_8450_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_8450_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_c77f_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_8cdd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6abd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_b4f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l453_l413_DUPLICATE_58e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_has_written_to_t : unsigned(0 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_device_in_result : device_in_result_t;
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_has_written_to_t := has_written_to_t;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_device_in_result := device_in_result;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_07f7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_07f7;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_afa0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_afa0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_8cdd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_8cdd;
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l438_c23_8450_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l444_c23_6abd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6abd_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l419_c6_d111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_left;
     BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output := BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output := result.is_stack_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l438_c37_19ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_left;
     BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output := BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l441_c9_47ca] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output := UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_5035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l437_c8_f7d9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_f7d9_return_output := device_in_result.is_dei_done;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_1d4c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_1d4c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_b4f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_b4f1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l427_c11_449c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_left;
     BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output := BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l433_c30_11f3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_ins;
     sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_x;
     sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output := sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_d111_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_449c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_5035_return_output;
     VAR_device_in_uxn_opcodes_h_l438_c23_8450_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_19ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_77c0_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_f7d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_0fc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_b4f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_b4f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_12a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_2b73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6abd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l419_l437_l430_l427_DUPLICATE_a90b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_2c37_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_47ca_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_1d4c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_1d4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_11f3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l441_c4_19e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output := t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l441_c4_19e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c4_19e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l441_c4_19e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l437_c8_0233] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output := UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c1_e733] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l441_c4_19e3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_e733_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_0233_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_19e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_t8_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- t8_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- printf_uxn_opcodes_h_l420_c3_1d1d[uxn_opcodes_h_l420_c3_1d1d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l420_c3_1d1d_uxn_opcodes_h_l420_c3_1d1d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_593f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- t8_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_593f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l437_c1_f8e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_f8e0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- device_in[uxn_opcodes_h_l438_c23_8450] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l438_c23_8450_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l438_c23_8450_device_address <= VAR_device_in_uxn_opcodes_h_l438_c23_8450_device_address;
     device_in_uxn_opcodes_h_l438_c23_8450_phase <= VAR_device_in_uxn_opcodes_h_l438_c23_8450_phase;
     device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l438_c23_8450_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l438_c23_8450_return_output := device_in_uxn_opcodes_h_l438_c23_8450_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_device_in_uxn_opcodes_h_l438_c23_8450_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l439_c32_c77f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_c77f_return_output := VAR_device_in_uxn_opcodes_h_l438_c23_8450_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_c77f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l437_c3_0f3c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_0f3c_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_c080] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_c080_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l427_c7_ac29] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_ac29_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l419_c2_1d4c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l453_l413_DUPLICATE_58e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l453_l413_DUPLICATE_58e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_1d4c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l453_l413_DUPLICATE_58e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ca8_uxn_opcodes_h_l453_l413_DUPLICATE_58e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_has_written_to_t <= REG_VAR_has_written_to_t;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_device_in_result <= REG_VAR_device_in_result;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     has_written_to_t <= REG_COMB_has_written_to_t;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     device_in_result <= REG_COMB_device_in_result;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
