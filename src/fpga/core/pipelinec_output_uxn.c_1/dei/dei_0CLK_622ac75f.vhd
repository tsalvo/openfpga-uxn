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
-- Submodules: 68
entity dei_0CLK_622ac75f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_622ac75f;
architecture arch of dei_0CLK_622ac75f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l430_c6_7fc7]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c1_282a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_8976]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c2_0ac7]
signal device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l431_c3_6c88[uxn_opcodes_h_l431_c3_6c88]
signal printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l438_c11_ea56]
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_8976]
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l438_c7_8976]
signal t8_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l438_c7_8976]
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l438_c7_8976]
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l441_c11_c124]
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c1_662d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l441_c7_2cfb]
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : device_in_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l445_c32_230b]
signal BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l445_c32_499f]
signal BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l445_c32_177d]
signal MUX_uxn_opcodes_h_l445_c32_177d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l445_c32_177d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l445_c32_177d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l445_c32_177d_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l449_c8_32b5]
signal UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l449_c1_7388]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l449_c3_b323]
signal result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l449_c3_b323]
signal has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l449_c3_b323]
signal device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output : device_in_result_t;

-- BIN_OP_MINUS[uxn_opcodes_h_l450_c37_0c65]
signal BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l450_c23_ea2a]
signal device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l450_c23_ea2a_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l450_c23_ea2a_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l450_c23_ea2a_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l454_c9_43e4]
signal UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l454_c4_941d]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l454_c4_941d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l454_c4_941d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l454_c4_941d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l454_c4_941d]
signal result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l454_c4_941d]
signal has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_device_ram_read := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7
BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7
result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7
result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7
result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7
result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7
result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7
result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c2_0ac7
t8_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7
has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7
device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

-- printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88
printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88 : entity work.printf_uxn_opcodes_h_l431_c3_6c88_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right,
BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976
result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976
result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976
result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- t8_MUX_uxn_opcodes_h_l438_c7_8976
t8_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l438_c7_8976_cond,
t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l438_c7_8976
device_in_result_MUX_uxn_opcodes_h_l438_c7_8976 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond,
device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue,
device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse,
device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124
BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left,
BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right,
BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb
result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb
result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb
result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- t8_MUX_uxn_opcodes_h_l441_c7_2cfb
t8_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb
device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond,
device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue,
device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse,
device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l445_c32_230b
BIN_OP_AND_uxn_opcodes_h_l445_c32_230b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left,
BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right,
BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l445_c32_499f
BIN_OP_GT_uxn_opcodes_h_l445_c32_499f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left,
BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right,
BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output);

-- MUX_uxn_opcodes_h_l445_c32_177d
MUX_uxn_opcodes_h_l445_c32_177d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l445_c32_177d_cond,
MUX_uxn_opcodes_h_l445_c32_177d_iftrue,
MUX_uxn_opcodes_h_l445_c32_177d_iffalse,
MUX_uxn_opcodes_h_l445_c32_177d_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5
UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr,
UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323
result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323
result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323
result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323
result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323
result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond,
result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323
has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond,
has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l449_c3_b323
device_in_result_MUX_uxn_opcodes_h_l449_c3_b323 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond,
device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue,
device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse,
device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65
BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left,
BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right,
BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output);

-- device_in_uxn_opcodes_h_l450_c23_ea2a
device_in_uxn_opcodes_h_l450_c23_ea2a : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l450_c23_ea2a_device_address,
device_in_uxn_opcodes_h_l450_c23_ea2a_phase,
device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read,
device_in_uxn_opcodes_h_l450_c23_ea2a_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4
UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr,
UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d
result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d
result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d
result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d
result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond,
result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d
has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond,
has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output,
 MUX_uxn_opcodes_h_l445_c32_177d_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output,
 device_in_uxn_opcodes_h_l450_c23_ea2a_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l434_c3_aa58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l430_c2_0ac7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_d07a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c32_177d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c32_177d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c32_177d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l445_c32_177d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l449_c8_d8c5_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l451_c32_560e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l452_c32_e70c_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l457_c5_126d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l458_c26_49b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l438_DUPLICATE_c5a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l441_l438_DUPLICATE_40d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l467_l424_DUPLICATE_ee0f_return_output : opcode_result_t;
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
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l445_c32_177d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l445_c32_177d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l457_c5_126d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l457_c5_126d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_d07a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l439_c3_d07a;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l434_c3_aa58 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l434_c3_aa58;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- UNARY_OP_NOT[uxn_opcodes_h_l454_c9_43e4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output := UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239_return_output := result.stack_address_sp_offset;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l430_c2_0ac7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l441_l438_DUPLICATE_40d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l441_l438_DUPLICATE_40d6_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l445_c32_230b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_left;
     BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output := BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l438_c11_ea56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_left;
     BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output := BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l449_c8_d8c5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l449_c8_d8c5_return_output := device_in_result.is_dei_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l441_c11_c124] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_left;
     BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output := BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l450_c37_0c65] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_left;
     BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output := BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l458_c26_49b9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l458_c26_49b9_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l438_DUPLICATE_c5a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l438_DUPLICATE_c5a2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c6_7fc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l445_c32_230b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c6_7fc7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l438_c11_ea56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l441_c11_c124_return_output;
     VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l450_c37_0c65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l430_l441_l438_DUPLICATE_3c19_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l449_c8_d8c5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l430_l441_l454_l438_DUPLICATE_3c2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l441_l454_l449_l438_DUPLICATE_0dcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l438_DUPLICATE_c5a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l430_l438_DUPLICATE_c5a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l441_l438_DUPLICATE_40d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l441_l438_DUPLICATE_40d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_f416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l458_c26_49b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l430_l441_l449_l438_DUPLICATE_17b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l441_l454_l449_DUPLICATE_1239_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l454_l438_l441_l449_l430_DUPLICATE_d975_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l454_c9_43e4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l430_c2_0ac7_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output := has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l445_c32_499f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_left;
     BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output := BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- t8_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c1_282a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l454_c4_941d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output := result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l449_c8_32b5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output := UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l445_c32_177d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l445_c32_499f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c1_282a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l449_c8_32b5_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l454_c4_941d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_t8_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output := has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- MUX[uxn_opcodes_h_l445_c32_177d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l445_c32_177d_cond <= VAR_MUX_uxn_opcodes_h_l445_c32_177d_cond;
     MUX_uxn_opcodes_h_l445_c32_177d_iftrue <= VAR_MUX_uxn_opcodes_h_l445_c32_177d_iftrue;
     MUX_uxn_opcodes_h_l445_c32_177d_iffalse <= VAR_MUX_uxn_opcodes_h_l445_c32_177d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l445_c32_177d_return_output := MUX_uxn_opcodes_h_l445_c32_177d_return_output;

     -- t8_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output := t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- printf_uxn_opcodes_h_l431_c3_6c88[uxn_opcodes_h_l431_c3_6c88] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l431_c3_6c88_uxn_opcodes_h_l431_c3_6c88_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue := VAR_MUX_uxn_opcodes_h_l445_c32_177d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l447_c1_662d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output;

     -- t8_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l447_c1_662d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l449_c1_7388] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output := has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l449_c1_7388_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- device_in[uxn_opcodes_h_l450_c23_ea2a] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l450_c23_ea2a_device_address <= VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_device_address;
     device_in_uxn_opcodes_h_l450_c23_ea2a_phase <= VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_phase;
     device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_return_output := device_in_uxn_opcodes_h_l450_c23_ea2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output := device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l451_c32_560e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l451_c32_560e_return_output := VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l452_c32_e70c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l452_c32_e70c_return_output := VAR_device_in_uxn_opcodes_h_l450_c23_ea2a_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l451_c32_560e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l452_c32_e70c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l449_c3_b323] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l449_c3_b323_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l441_c7_2cfb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output := device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l441_c7_2cfb_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l438_c7_8976] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l438_c7_8976_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c2_0ac7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l467_l424_DUPLICATE_ee0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l467_l424_DUPLICATE_ee0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c2_0ac7_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l467_l424_DUPLICATE_ee0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7bb2_uxn_opcodes_h_l467_l424_DUPLICATE_ee0f_return_output;
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
