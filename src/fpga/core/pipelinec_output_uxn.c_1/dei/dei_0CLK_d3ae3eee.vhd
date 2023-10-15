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
-- Submodules: 59
entity dei_0CLK_d3ae3eee is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_d3ae3eee;
architecture arch of dei_0CLK_d3ae3eee is
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
-- BIN_OP_EQ[uxn_opcodes_h_l424_c6_408d]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l424_c2_24e5]
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l424_c2_24e5]
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c2_24e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l424_c2_24e5]
signal t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l432_c11_8d6e]
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c7_3c79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l432_c7_eb3e]
signal t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l435_c11_cda4]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_df32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c7_3c79]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c7_3c79]
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_3c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c7_3c79]
signal t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l438_c32_c52d]
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l438_c32_3de4]
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l438_c32_f40f]
signal MUX_uxn_opcodes_h_l438_c32_f40f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_f40f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_f40f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_f40f_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l442_c8_b1bd]
signal UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_cdfe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l442_c3_1c36]
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l442_c3_1c36]
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : device_in_result_t;

-- result_stack_value_MUX[uxn_opcodes_h_l442_c3_1c36]
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c3_1c36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l442_c3_1c36]
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c3_1c36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c3_1c36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l443_c37_0621]
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l443_c23_455e]
signal device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_455e_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_455e_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_455e_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l446_c9_174b]
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l446_c4_cf90]
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l446_c4_cf90]
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l446_c4_cf90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c4_cf90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l446_c4_cf90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d
BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5
device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5
result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- t8_MUX_uxn_opcodes_h_l424_c2_24e5
t8_MUX_uxn_opcodes_h_l424_c2_24e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond,
t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue,
t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse,
t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e
BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left,
BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right,
BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e
device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e
result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- t8_MUX_uxn_opcodes_h_l432_c7_eb3e
t8_MUX_uxn_opcodes_h_l432_c7_eb3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond,
t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue,
t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse,
t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4
BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79
device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79
result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c7_3c79
t8_MUX_uxn_opcodes_h_l435_c7_3c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond,
t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue,
t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse,
t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d
BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left,
BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right,
BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4
BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left,
BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right,
BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output);

-- MUX_uxn_opcodes_h_l438_c32_f40f
MUX_uxn_opcodes_h_l438_c32_f40f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l438_c32_f40f_cond,
MUX_uxn_opcodes_h_l438_c32_f40f_iftrue,
MUX_uxn_opcodes_h_l438_c32_f40f_iffalse,
MUX_uxn_opcodes_h_l438_c32_f40f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr,
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36
device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36
result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left,
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right,
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output);

-- device_in_uxn_opcodes_h_l443_c23_455e
device_in_uxn_opcodes_h_l443_c23_455e : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l443_c23_455e_device_address,
device_in_uxn_opcodes_h_l443_c23_455e_phase,
device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read,
device_in_uxn_opcodes_h_l443_c23_455e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr,
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90
result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output,
 BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output,
 MUX_uxn_opcodes_h_l438_c32_f40f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output,
 device_in_uxn_opcodes_h_l443_c23_455e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_24e5_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_932e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_861a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_f40f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_f40f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_22e3_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_455e_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_455e_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_455e_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_58ad_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_0c68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_383b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l432_l424_DUPLICATE_fea1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l418_l458_DUPLICATE_3c76_return_output : opcode_result_t;
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
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_861a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_861a;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_932e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_932e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right := to_unsigned(128, 8);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_0c68 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_0c68;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l443_c23_455e_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c6_408d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433_return_output := result.sp_relative_shift;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_24e5_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- UNARY_OP_NOT[uxn_opcodes_h_l446_c9_174b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output := UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l442_c8_22e3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_22e3_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l432_l424_DUPLICATE_fea1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l432_l424_DUPLICATE_fea1_return_output := result.is_sp_shift;

     -- BIN_OP_MINUS[uxn_opcodes_h_l443_c37_0621] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_left;
     BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output := BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l449_c26_383b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_383b_return_output := device_in_result.dei_value;

     -- BIN_OP_AND[uxn_opcodes_h_l438_c32_c52d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_left;
     BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output := BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c11_cda4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_24e5_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l432_c11_8d6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_c52d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_408d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_8d6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_cda4_return_output;
     VAR_device_in_uxn_opcodes_h_l443_c23_455e_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_0621_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l435_l432_l424_DUPLICATE_3433_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_22e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l446_l435_l432_l442_DUPLICATE_54ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l432_l424_DUPLICATE_fea1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l432_l424_DUPLICATE_fea1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_383b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l435_l432_l424_l442_DUPLICATE_7a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l446_l435_l442_DUPLICATE_cd27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l435_l442_l424_l432_l446_DUPLICATE_61f1_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_174b_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_24e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_24e5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l446_c4_cf90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l446_c4_cf90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output := result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l442_c8_b1bd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output := UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c4_cf90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l446_c4_cf90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l438_c32_3de4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_left;
     BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output := BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l446_c4_cf90] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output := has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l438_c32_f40f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_3de4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_b1bd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_cf90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- MUX[uxn_opcodes_h_l438_c32_f40f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l438_c32_f40f_cond <= VAR_MUX_uxn_opcodes_h_l438_c32_f40f_cond;
     MUX_uxn_opcodes_h_l438_c32_f40f_iftrue <= VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iftrue;
     MUX_uxn_opcodes_h_l438_c32_f40f_iffalse <= VAR_MUX_uxn_opcodes_h_l438_c32_f40f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l438_c32_f40f_return_output := MUX_uxn_opcodes_h_l438_c32_f40f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue := VAR_MUX_uxn_opcodes_h_l438_c32_f40f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_df32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- t8_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_df32_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_cdfe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_cdfe_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- device_in[uxn_opcodes_h_l443_c23_455e] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l443_c23_455e_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l443_c23_455e_device_address <= VAR_device_in_uxn_opcodes_h_l443_c23_455e_device_address;
     device_in_uxn_opcodes_h_l443_c23_455e_phase <= VAR_device_in_uxn_opcodes_h_l443_c23_455e_phase;
     device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l443_c23_455e_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l443_c23_455e_return_output := device_in_uxn_opcodes_h_l443_c23_455e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_device_in_uxn_opcodes_h_l443_c23_455e_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l444_c32_58ad] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_58ad_return_output := VAR_device_in_uxn_opcodes_h_l443_c23_455e_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_58ad_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l442_c3_1c36] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_1c36_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c7_3c79] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_3c79_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l432_c7_eb3e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_eb3e_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l424_c2_24e5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l418_l458_DUPLICATE_3c76 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l418_l458_DUPLICATE_3c76_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_24e5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_24e5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l418_l458_DUPLICATE_3c76_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1d0_uxn_opcodes_h_l418_l458_DUPLICATE_3c76_return_output;
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
