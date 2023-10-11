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
-- BIN_OP_EQ[uxn_opcodes_h_l424_c6_5e09]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l424_c1_a5c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l432_c7_c696]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l424_c2_941c]
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l424_c2_941c]
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l424_c2_941c]
signal t8_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c2_941c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l425_c3_0bad[uxn_opcodes_h_l425_c3_0bad]
signal printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l432_c11_b937]
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c7_9d83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l432_c7_c696]
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l432_c7_c696]
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l432_c7_c696]
signal t8_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l432_c7_c696]
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l435_c11_0ca0]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_e488]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l435_c7_9d83]
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l435_c7_9d83]
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l435_c7_9d83]
signal t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l435_c7_9d83]
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l438_c32_4056]
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l438_c32_6a71]
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l438_c32_4099]
signal MUX_uxn_opcodes_h_l438_c32_4099_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_4099_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_4099_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l438_c32_4099_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l442_c8_feda]
signal UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_d5e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l442_c3_9d25]
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : device_in_result_t;

-- has_written_to_t_MUX[uxn_opcodes_h_l442_c3_9d25]
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c3_9d25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c3_9d25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l442_c3_9d25]
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c3_9d25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l442_c3_9d25]
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l443_c37_ace1]
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l443_c23_6c25]
signal device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_6c25_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_6c25_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l443_c23_6c25_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l446_c9_add2]
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l446_c4_eee2]
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c4_eee2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l446_c4_eee2]
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l446_c4_eee2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l446_c4_eee2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09
BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l424_c2_941c
device_in_result_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond,
device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- t8_MUX_uxn_opcodes_h_l424_c2_941c
t8_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l424_c2_941c_cond,
t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c
result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

-- printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad
printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad : entity work.printf_uxn_opcodes_h_l425_c3_0bad_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937
BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left,
BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right,
BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l432_c7_c696
device_in_result_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond,
device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- t8_MUX_uxn_opcodes_h_l432_c7_c696
t8_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l432_c7_c696_cond,
t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696
result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0
BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83
device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- t8_MUX_uxn_opcodes_h_l435_c7_9d83
t8_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83
result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l438_c32_4056
BIN_OP_AND_uxn_opcodes_h_l438_c32_4056 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left,
BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right,
BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71
BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left,
BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right,
BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output);

-- MUX_uxn_opcodes_h_l438_c32_4099
MUX_uxn_opcodes_h_l438_c32_4099 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l438_c32_4099_cond,
MUX_uxn_opcodes_h_l438_c32_4099_iftrue,
MUX_uxn_opcodes_h_l438_c32_4099_iffalse,
MUX_uxn_opcodes_h_l438_c32_4099_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr,
UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25
device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25
result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left,
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right,
BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output);

-- device_in_uxn_opcodes_h_l443_c23_6c25
device_in_uxn_opcodes_h_l443_c23_6c25 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l443_c23_6c25_device_address,
device_in_uxn_opcodes_h_l443_c23_6c25_phase,
device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read,
device_in_uxn_opcodes_h_l443_c23_6c25_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr,
UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2
result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output,
 device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output,
 BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output,
 BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output,
 MUX_uxn_opcodes_h_l438_c32_4099_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output,
 device_in_uxn_opcodes_h_l443_c23_6c25_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_941c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3684 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_bdfd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_4099_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_4099_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_4099_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l438_c32_4099_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_7e06_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_6c25_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_6c25_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l443_c23_6c25_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_5a8a_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_18ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_0c8f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l424_l432_DUPLICATE_0916_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l458_l418_DUPLICATE_3f5a_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3684 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l427_c3_3684;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_bdfd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l433_c3_bdfd;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_18ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l448_c5_18ce;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l438_c32_4099_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l438_c32_4099_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l443_c23_6c25_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_AND[uxn_opcodes_h_l438_c32_4056] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_left;
     BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output := BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l432_c11_b937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_left;
     BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output := BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l443_c37_ace1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c11_0ca0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output := result.is_stack_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_941c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l424_l432_DUPLICATE_0916 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l424_l432_DUPLICATE_0916_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output := result.device_ram_address;

     -- UNARY_OP_NOT[uxn_opcodes_h_l446_c9_add2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output := UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l442_c8_7e06] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_7e06_return_output := device_in_result.is_dei_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c6_5e09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_941c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l449_c26_0c8f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_0c8f_return_output := device_in_result.dei_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left := VAR_BIN_OP_AND_uxn_opcodes_h_l438_c32_4056_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c6_5e09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l432_c11_b937_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_0ca0_return_output;
     VAR_device_in_uxn_opcodes_h_l443_c23_6c25_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l443_c37_ace1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l424_l435_l432_DUPLICATE_e18f_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l442_c8_7e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l432_l435_l446_l442_DUPLICATE_7cb1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l424_l432_DUPLICATE_0916_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l424_l432_DUPLICATE_0916_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_4fa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l449_c26_0c8f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l435_l432_l442_DUPLICATE_fefe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l435_l446_l442_DUPLICATE_6dac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l446_l442_l432_l424_l435_DUPLICATE_a1ba_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l446_c9_add2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l424_c2_941c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_c2_941c_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- t8_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l438_c32_6a71] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_left;
     BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output := BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l446_c4_eee2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l446_c4_eee2] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output := has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l446_c4_eee2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output := result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l442_c8_feda] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output := UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l424_c1_a5c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l446_c4_eee2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l446_c4_eee2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l438_c32_4099_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c32_6a71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c1_a5c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l442_c8_feda_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l446_c4_eee2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_t8_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- MUX[uxn_opcodes_h_l438_c32_4099] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l438_c32_4099_cond <= VAR_MUX_uxn_opcodes_h_l438_c32_4099_cond;
     MUX_uxn_opcodes_h_l438_c32_4099_iftrue <= VAR_MUX_uxn_opcodes_h_l438_c32_4099_iftrue;
     MUX_uxn_opcodes_h_l438_c32_4099_iffalse <= VAR_MUX_uxn_opcodes_h_l438_c32_4099_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l438_c32_4099_return_output := MUX_uxn_opcodes_h_l438_c32_4099_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- t8_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output := t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- printf_uxn_opcodes_h_l425_c3_0bad[uxn_opcodes_h_l425_c3_0bad] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l425_c3_0bad_uxn_opcodes_h_l425_c3_0bad_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue := VAR_MUX_uxn_opcodes_h_l438_c32_4099_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l440_c1_e488] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- t8_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output := t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l440_c1_e488_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l424_c2_941c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_d5e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output := has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_d5e7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- device_in[uxn_opcodes_h_l443_c23_6c25] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l443_c23_6c25_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l443_c23_6c25_device_address <= VAR_device_in_uxn_opcodes_h_l443_c23_6c25_device_address;
     device_in_uxn_opcodes_h_l443_c23_6c25_phase <= VAR_device_in_uxn_opcodes_h_l443_c23_6c25_phase;
     device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l443_c23_6c25_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l443_c23_6c25_return_output := device_in_uxn_opcodes_h_l443_c23_6c25_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output := has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_device_in_uxn_opcodes_h_l443_c23_6c25_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l424_c2_941c_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l444_c32_5a8a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_5a8a_return_output := VAR_device_in_uxn_opcodes_h_l443_c23_6c25_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l444_c32_5a8a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l442_c3_9d25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c3_9d25_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l435_c7_9d83] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output := device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l435_c7_9d83_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output := device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l432_c7_c696] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l424_c2_941c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l432_c7_c696_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l424_c2_941c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l458_l418_DUPLICATE_3f5a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l458_l418_DUPLICATE_3f5a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c2_941c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c2_941c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l458_l418_DUPLICATE_3f5a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbf8_uxn_opcodes_h_l458_l418_DUPLICATE_3f5a_return_output;
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
