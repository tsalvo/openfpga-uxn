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
-- BIN_OP_EQ[uxn_opcodes_h_l422_c6_0d44]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l422_c1_d0dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_7668]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l422_c2_cd8c]
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l423_c3_cdf4[uxn_opcodes_h_l423_c3_cdf4]
signal printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_e8e7]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_7668]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_7668]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l430_c7_7668]
signal t8_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c7_7668]
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l433_c11_9cce]
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_254d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l433_c7_1ac2]
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l436_c30_c47d]
signal sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_9e04]
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_cd8a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_41cc]
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_41cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_41cc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_41cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_41cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l440_c3_41cc]
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l440_c3_41cc]
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : device_in_result_t;

-- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_597a]
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l441_c23_2551]
signal device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2551_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2551_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2551_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_7eda]
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_0ce3]
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_0ce3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_0ce3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l444_c4_0ce3]
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_0ce3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44
BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c
result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- t8_MUX_uxn_opcodes_h_l422_c2_cd8c
t8_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c
device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond,
device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

-- printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4
printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4 : entity work.printf_uxn_opcodes_h_l423_c3_cdf4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7
BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668
result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c7_7668
t8_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c7_7668_cond,
t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c7_7668
device_in_result_MUX_uxn_opcodes_h_l430_c7_7668 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce
BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2
result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- t8_MUX_uxn_opcodes_h_l433_c7_1ac2
t8_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2
device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond,
device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue,
device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse,
device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l436_c30_c47d
sp_relative_shift_uxn_opcodes_h_l436_c30_c47d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins,
sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x,
sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y,
sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr,
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc
result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc
device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond,
device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue,
device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse,
device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output);

-- device_in_uxn_opcodes_h_l441_c23_2551
device_in_uxn_opcodes_h_l441_c23_2551 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l441_c23_2551_device_address,
device_in_uxn_opcodes_h_l441_c23_2551_phase,
device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read,
device_in_uxn_opcodes_h_l441_c23_2551_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr,
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3
result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output,
 sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output,
 device_in_uxn_opcodes_h_l441_c23_2551_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_3e48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_cd8c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_71b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_1941_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2551_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2551_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2551_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_a85a_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_3be8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_1494_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_12ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l456_l416_DUPLICATE_b6f4_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_71b3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_71b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_3e48 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_3e48;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_3be8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_3be8;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l441_c23_2551_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_e8e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_7eda] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output := UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_597a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_12ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_12ed_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l436_c30_c47d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_ins;
     sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_x;
     sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output := sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l440_c8_1941] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_1941_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l447_c23_1494] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_1494_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output := result.is_stack_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_cd8c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l433_c11_9cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c6_0d44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output := result.u8_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_cd8c_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_0d44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_e8e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_9cce_return_output;
     VAR_device_in_uxn_opcodes_h_l441_c23_2551_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_597a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l422_l430_l433_DUPLICATE_bd9c_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_1941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l440_l430_l444_l433_DUPLICATE_0bc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_12ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_12ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_00c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l444_l433_DUPLICATE_6556_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_1494_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l422_l440_l430_l433_DUPLICATE_4105_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l430_l433_l440_l422_l444_DUPLICATE_71ec_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_7eda_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_cd8c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_cd8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_c47d_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_9e04] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output := UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_0ce3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l422_c1_d0dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output;

     -- t8_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_0ce3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_0ce3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l444_c4_0ce3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output := result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_0ce3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_d0dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_9e04_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_0ce3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_t8_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- printf_uxn_opcodes_h_l423_c3_cdf4[uxn_opcodes_h_l423_c3_cdf4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l423_c3_cdf4_uxn_opcodes_h_l423_c3_cdf4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- t8_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output := t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_254d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- t8_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_254d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_cd8a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_cd8a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     -- device_in[uxn_opcodes_h_l441_c23_2551] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l441_c23_2551_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l441_c23_2551_device_address <= VAR_device_in_uxn_opcodes_h_l441_c23_2551_device_address;
     device_in_uxn_opcodes_h_l441_c23_2551_phase <= VAR_device_in_uxn_opcodes_h_l441_c23_2551_phase;
     device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l441_c23_2551_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l441_c23_2551_return_output := device_in_uxn_opcodes_h_l441_c23_2551_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_device_in_uxn_opcodes_h_l441_c23_2551_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l442_c32_a85a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_a85a_return_output := VAR_device_in_uxn_opcodes_h_l441_c23_2551_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_a85a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_41cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_41cc_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_1ac2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_1ac2_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_7668] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_7668_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_cd8c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l456_l416_DUPLICATE_b6f4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l456_l416_DUPLICATE_b6f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_cd8c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l456_l416_DUPLICATE_b6f4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee9e_uxn_opcodes_h_l456_l416_DUPLICATE_b6f4_return_output;
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