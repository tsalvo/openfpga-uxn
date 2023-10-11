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
-- Submodules: 61
entity dei_0CLK_97c0477d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_97c0477d;
architecture arch of dei_0CLK_97c0477d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l422_c6_ca1d]
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l422_c1_61b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_afec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l422_c2_9956]
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l422_c2_9956]
signal t8_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_9956]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_9956]
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l423_c3_4609[uxn_opcodes_h_l423_c3_4609]
signal printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_fbb3]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c7_afec]
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l430_c7_afec]
signal t8_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_afec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_afec]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l433_c11_36d4]
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_bb51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_ac4b]
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l436_c32_f7ec]
signal BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l436_c32_5653]
signal BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l436_c32_bdd6]
signal MUX_uxn_opcodes_h_l436_c32_bdd6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l436_c32_bdd6_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_da69]
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_f05a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l440_c3_b81f]
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : device_in_result_t;

-- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_b81f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_b81f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_b81f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_b81f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l440_c3_b81f]
signal result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_b81f]
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_ed71]
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l441_c23_14a0]
signal device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_14a0_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_14a0_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l441_c23_14a0_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_4084]
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_4ab1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_4ab1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l444_c4_4ab1]
signal result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_4ab1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_4ab1]
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a947( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d
BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right,
BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l422_c2_9956
device_in_result_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond,
device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- t8_MUX_uxn_opcodes_h_l422_c2_9956
t8_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l422_c2_9956_cond,
t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956
result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

-- printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609
printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609 : entity work.printf_uxn_opcodes_h_l423_c3_4609_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3
BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c7_afec
device_in_result_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c7_afec
t8_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c7_afec_cond,
t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec
result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4
BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right,
BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b
device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- t8_MUX_uxn_opcodes_h_l433_c7_ac4b
t8_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b
result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec
BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left,
BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right,
BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l436_c32_5653
BIN_OP_GT_uxn_opcodes_h_l436_c32_5653 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left,
BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right,
BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output);

-- MUX_uxn_opcodes_h_l436_c32_bdd6
MUX_uxn_opcodes_h_l436_c32_bdd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l436_c32_bdd6_cond,
MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue,
MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse,
MUX_uxn_opcodes_h_l436_c32_bdd6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr,
UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f
device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f
result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right,
BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output);

-- device_in_uxn_opcodes_h_l441_c23_14a0
device_in_uxn_opcodes_h_l441_c23_14a0 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l441_c23_14a0_device_address,
device_in_uxn_opcodes_h_l441_c23_14a0_phase,
device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read,
device_in_uxn_opcodes_h_l441_c23_14a0_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr,
UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1
result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond,
result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output,
 device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output,
 BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output,
 MUX_uxn_opcodes_h_l436_c32_bdd6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output,
 device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output,
 device_in_uxn_opcodes_h_l441_c23_14a0_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_9956_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_840c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_bd51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_88fa_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_14a0_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_14a0_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l441_c23_14a0_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_dc56_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_069b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c26_0a94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l422_DUPLICATE_ebd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l456_l416_DUPLICATE_56d9_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_840c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_840c;
     VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right := to_unsigned(128, 8);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_069b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c5_069b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_bd51 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_bd51;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right := to_unsigned(3, 2);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l441_c23_14a0_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l447_c26_0a94] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c26_0a94_return_output := device_in_result.dei_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_9956_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l440_c8_88fa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_88fa_return_output := device_in_result.is_dei_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_fbb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l441_c37_ed71] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_left;
     BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output := BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l436_c32_f7ec] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_left;
     BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output := BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l433_c11_36d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output := result.is_opc_done;

     -- UNARY_OP_NOT[uxn_opcodes_h_l444_c9_4084] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output := UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9_return_output := result.sp_relative_shift;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_9956_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l422_c6_ca1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l422_DUPLICATE_ebd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l422_DUPLICATE_ebd7_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left := VAR_BIN_OP_AND_uxn_opcodes_h_l436_c32_f7ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l422_c6_ca1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_fbb3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l433_c11_36d4_return_output;
     VAR_device_in_uxn_opcodes_h_l441_c23_14a0_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l441_c37_ed71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l422_l433_DUPLICATE_a0d9_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l440_c8_88fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l430_l433_l440_l444_DUPLICATE_a5a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l422_DUPLICATE_ebd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l422_DUPLICATE_ebd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_a6ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l447_c26_0a94_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l422_l433_l440_DUPLICATE_1c42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l440_l433_l444_DUPLICATE_2aef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l440_l422_l433_l430_l444_DUPLICATE_efba_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l444_c9_4084_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l422_c2_9956_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l422_c2_9956_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l436_c32_5653] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_left;
     BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output := BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l444_c4_4ab1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l444_c4_4ab1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l444_c4_4ab1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l440_c8_da69] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output := UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l444_c4_4ab1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output := result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;

     -- t8_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l444_c4_4ab1] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output := has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l422_c1_61b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l436_c32_5653_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l422_c1_61b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l440_c8_da69_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l444_c4_4ab1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     -- MUX[uxn_opcodes_h_l436_c32_bdd6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l436_c32_bdd6_cond <= VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_cond;
     MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue <= VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iftrue;
     MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse <= VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_return_output := MUX_uxn_opcodes_h_l436_c32_bdd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- t8_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output := t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- printf_uxn_opcodes_h_l423_c3_4609[uxn_opcodes_h_l423_c3_4609] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l423_c3_4609_uxn_opcodes_h_l423_c3_4609_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue := VAR_MUX_uxn_opcodes_h_l436_c32_bdd6_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_t8_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- t8_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output := t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_bb51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_bb51_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l422_c2_9956_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_f05a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_f05a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- device_in[uxn_opcodes_h_l441_c23_14a0] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l441_c23_14a0_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l441_c23_14a0_device_address <= VAR_device_in_uxn_opcodes_h_l441_c23_14a0_device_address;
     device_in_uxn_opcodes_h_l441_c23_14a0_phase <= VAR_device_in_uxn_opcodes_h_l441_c23_14a0_phase;
     device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l441_c23_14a0_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l441_c23_14a0_return_output := device_in_uxn_opcodes_h_l441_c23_14a0_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output := has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_device_in_uxn_opcodes_h_l441_c23_14a0_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l422_c2_9956_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l442_c32_dc56] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_dc56_return_output := VAR_device_in_uxn_opcodes_h_l441_c23_14a0_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_c32_dc56_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l440_c3_b81f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l440_c3_b81f_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l433_c7_ac4b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l433_c7_ac4b_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_afec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output := device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l422_c2_9956_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_afec_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l422_c2_9956] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l456_l416_DUPLICATE_56d9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l456_l416_DUPLICATE_56d9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a947(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l422_c2_9956_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l422_c2_9956_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l456_l416_DUPLICATE_56d9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a947_uxn_opcodes_h_l456_l416_DUPLICATE_56d9_return_output;
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
