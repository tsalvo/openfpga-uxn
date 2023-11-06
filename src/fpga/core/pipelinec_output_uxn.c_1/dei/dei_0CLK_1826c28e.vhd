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
entity dei_0CLK_1826c28e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_1826c28e;
architecture arch of dei_0CLK_1826c28e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal has_written_to_t : unsigned(0 downto 0) := to_unsigned(0, 1);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_in_result : device_in_result_t := device_in_result_t_NULL;
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_has_written_to_t : unsigned(0 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_device_in_result : device_in_result_t;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l392_c6_2c49]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_4743]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_73f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : device_in_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_3ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l393_c3_ca1a[uxn_opcodes_h_l393_c3_ca1a]
signal printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_43e8]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l400_c7_73f7]
signal t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_73f7]
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l400_c7_73f7]
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : device_in_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_73f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l403_c11_5258]
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_dc21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : device_in_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_ebf0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l406_c30_312e]
signal sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_a38f]
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_6e91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : device_in_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_d4c7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_c631]
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l411_c23_8da3]
signal device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_8da3_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_8da3_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_8da3_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_3b0f]
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_da83]
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_da83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l414_c4_da83]
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_da83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_da83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49
BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- t8_MUX_uxn_opcodes_h_l392_c2_3ec9
t8_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9
device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

-- printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a
printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a : entity work.printf_uxn_opcodes_h_l393_c3_ca1a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8
BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- t8_MUX_uxn_opcodes_h_l400_c7_73f7
t8_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7
device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7
result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258
BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output);

-- t8_MUX_uxn_opcodes_h_l403_c7_ebf0
t8_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0
device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0
result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l406_c30_312e
sp_relative_shift_uxn_opcodes_h_l406_c30_312e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins,
sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x,
sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y,
sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr,
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7
device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7
result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output);

-- device_in_uxn_opcodes_h_l411_c23_8da3
device_in_uxn_opcodes_h_l411_c23_8da3 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l411_c23_8da3_device_address,
device_in_uxn_opcodes_h_l411_c23_8da3_phase,
device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read,
device_in_uxn_opcodes_h_l411_c23_8da3_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr,
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83
result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output);



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
 device_in_result,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output,
 t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output,
 sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output,
 device_in_uxn_opcodes_h_l411_c23_8da3_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3ec9_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_554c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_fc67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_6d93_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_8da3_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_8da3_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_8da3_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8e54_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_d3b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_8f34_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_3db3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l426_l386_DUPLICATE_4b7e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_has_written_to_t : unsigned(0 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_device_in_result : device_in_result_t;
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_has_written_to_t := has_written_to_t;
  REG_VAR_t8 := t8;
  REG_VAR_device_in_result := device_in_result;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_d3b2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_d3b2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_fc67 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_fc67;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_554c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_554c;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l411_c23_8da3_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l406_c30_312e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_ins;
     sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_x;
     sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output := sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l417_c23_8f34] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_8f34_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_43e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_c631] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_left;
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output := BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_3db3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_3db3_return_output := result.is_sp_shift;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3ec9_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c6_2c49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l403_c11_5258] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_left;
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output := BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_3b0f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output := UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3ec9_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l410_c8_6d93] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_6d93_return_output := device_in_result.is_dei_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_2c49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_43e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_5258_return_output;
     VAR_device_in_uxn_opcodes_h_l411_c23_8da3_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_c631_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l400_l392_DUPLICATE_dab6_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_6d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l400_l410_l414_DUPLICATE_3913_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_3db3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_3db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_c847_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_7112_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_8f34_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l400_l392_l410_DUPLICATE_5d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l400_l403_l410_l392_DUPLICATE_876f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_3b0f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3ec9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3ec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_312e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_4743] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_da83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_da83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_da83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output;

     -- t8_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l414_c4_da83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output := result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_a38f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output := UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_da83] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output := has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_4743_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_a38f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_da83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_da83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_da83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_da83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_da83_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- printf_uxn_opcodes_h_l393_c3_ca1a[uxn_opcodes_h_l393_c3_ca1a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l393_c3_ca1a_uxn_opcodes_h_l393_c3_ca1a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- t8_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_dc21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_dc21_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_6e91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_6e91_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- device_in[uxn_opcodes_h_l411_c23_8da3] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l411_c23_8da3_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l411_c23_8da3_device_address <= VAR_device_in_uxn_opcodes_h_l411_c23_8da3_device_address;
     device_in_uxn_opcodes_h_l411_c23_8da3_phase <= VAR_device_in_uxn_opcodes_h_l411_c23_8da3_phase;
     device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l411_c23_8da3_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l411_c23_8da3_return_output := device_in_uxn_opcodes_h_l411_c23_8da3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_device_in_uxn_opcodes_h_l411_c23_8da3_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l412_c32_8e54] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8e54_return_output := VAR_device_in_uxn_opcodes_h_l411_c23_8da3_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8e54_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_d4c7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_d4c7_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_ebf0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_ebf0_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_73f7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_73f7_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_3ec9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l426_l386_DUPLICATE_4b7e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l426_l386_DUPLICATE_4b7e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7764(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3ec9_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l426_l386_DUPLICATE_4b7e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7764_uxn_opcodes_h_l426_l386_DUPLICATE_4b7e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_has_written_to_t <= REG_VAR_has_written_to_t;
REG_COMB_t8 <= REG_VAR_t8;
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
     device_in_result <= REG_COMB_device_in_result;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
