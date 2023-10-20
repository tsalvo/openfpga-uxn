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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 57
entity dei_0CLK_96708482 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_96708482;
architecture arch of dei_0CLK_96708482 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l422_c6_8b57]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_3f22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_4ebf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_2a7c]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_3f22]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c7_3f22]
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l430_c7_3f22]
signal t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_3f22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l433_c11_1a0a]
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_bcd6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_a3e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l436_c30_28c8]
signal sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_77f1]
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_e0c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_01f3]
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l440_c3_01f3]
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : device_in_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_01f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l440_c3_01f3]
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_01f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_01f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_01f3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_95ff]
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l441_c23_2126]
signal device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2126_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2126_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_2126_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_a1d7]
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_6947]
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_6947]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_6947]
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_6947]
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l444_c4_6947]
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8587( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57
BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf
device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- t8_MUX_uxn_opcodes_h_l422_c2_4ebf
t8_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf
result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c
BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22
device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c7_3f22
t8_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22
result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a
BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4
device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- t8_MUX_uxn_opcodes_h_l433_c7_a3e4
t8_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4
result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l436_c30_28c8
sp_relative_shift_uxn_opcodes_h_l436_c30_28c8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins,
sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x,
sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y,
sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr,
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3
device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3
result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output);

-- device_in_uxn_opcodes_h_l441_c23_2126
device_in_uxn_opcodes_h_l441_c23_2126 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l441_c23_2126_device_address,
device_in_uxn_opcodes_h_l441_c23_2126_phase,
device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read,
device_in_uxn_opcodes_h_l441_c23_2126_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr,
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947
result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output,
 sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output,
 device_in_uxn_opcodes_h_l441_c23_2126_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_4ebf_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e9ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_e836 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_32ca_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2126_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2126_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_2126_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_2878_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_dc45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_f666_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_b2dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8587_uxn_opcodes_h_l456_l416_DUPLICATE_335e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e9ff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e9ff;
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_e836 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_e836;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_dc45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_dc45;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l441_c23_2126_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_2a7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output := result.u8_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_95ff] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_left;
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output := BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_4ebf_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l433_c11_1a0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l436_c30_28c8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_ins;
     sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_x;
     sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output := sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l447_c23_f666] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_f666_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_b2dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_b2dc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l440_c8_32ca] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_32ca_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output := result.is_stack_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_4ebf_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c6_8b57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_a1d7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output := UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_8b57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_2a7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_1a0a_return_output;
     VAR_device_in_uxn_opcodes_h_l441_c23_2126_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_95ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l433_l422_l430_DUPLICATE_0e52_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_32ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l433_l444_l440_l430_DUPLICATE_4005_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_b2dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l422_l430_DUPLICATE_b2dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_087f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l433_l444_l440_DUPLICATE_a1d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c23_f666_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l433_l422_l440_l430_DUPLICATE_c230_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l444_l430_l433_l422_l440_DUPLICATE_ea43_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_a1d7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_4ebf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_4ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l436_c30_28c8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_6947] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_6947] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output := has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l444_c4_6947] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_cond;
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output := result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_6947] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_6947] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_77f1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output := UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_77f1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_6947_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_6947_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_6947_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_6947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l444_c4_6947_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_t8_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- t8_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_bcd6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- t8_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bcd6_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_e0c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e0c0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- device_in[uxn_opcodes_h_l441_c23_2126] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l441_c23_2126_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l441_c23_2126_device_address <= VAR_device_in_uxn_opcodes_h_l441_c23_2126_device_address;
     device_in_uxn_opcodes_h_l441_c23_2126_phase <= VAR_device_in_uxn_opcodes_h_l441_c23_2126_phase;
     device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l441_c23_2126_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l441_c23_2126_return_output := device_in_uxn_opcodes_h_l441_c23_2126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_device_in_uxn_opcodes_h_l441_c23_2126_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l442_c32_2878] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_2878_return_output := VAR_device_in_uxn_opcodes_h_l441_c23_2126_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_2878_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_01f3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_01f3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_a3e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_a3e4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_3f22] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_3f22_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_4ebf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8587_uxn_opcodes_h_l456_l416_DUPLICATE_335e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8587_uxn_opcodes_h_l456_l416_DUPLICATE_335e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8587(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_4ebf_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8587_uxn_opcodes_h_l456_l416_DUPLICATE_335e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8587_uxn_opcodes_h_l456_l416_DUPLICATE_335e_return_output;
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
