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
-- BIN_OP_EQ[uxn_opcodes_h_l392_c6_161c]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_3fb7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_e9da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_f01f]
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l392_c2_f01f]
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l392_c2_f01f]
signal t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l392_c2_f01f]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l393_c3_6914[uxn_opcodes_h_l393_c3_6914]
signal printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_c08a]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_e166]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_e9da]
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l400_c7_e9da]
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l400_c7_e9da]
signal t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_e9da]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l403_c11_544c]
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_bccc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_e166]
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l403_c7_e166]
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output : device_in_result_t;

-- t8_MUX[uxn_opcodes_h_l403_c7_e166]
signal t8_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l403_c7_e166]
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l406_c30_164f]
signal sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_af62]
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_afd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : device_in_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l410_c3_8cdc]
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_e929]
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l411_c23_72c5]
signal device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_72c5_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_72c5_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_72c5_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_0dfa]
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_db96]
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_db96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_db96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_db96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l414_c4_db96]
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f010( ref_toks_0 : opcode_result_t;
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
      base.device_ram_address := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c
BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f
device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- t8_MUX_uxn_opcodes_h_l392_c2_f01f
t8_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f
result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

-- printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914
printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914 : entity work.printf_uxn_opcodes_h_l393_c3_6914_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a
BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da
device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- t8_MUX_uxn_opcodes_h_l400_c7_e9da
t8_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c
BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l403_c7_e166
device_in_result_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond,
device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- t8_MUX_uxn_opcodes_h_l403_c7_e166
t8_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l403_c7_e166_cond,
t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166
result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output);

-- sp_relative_shift_uxn_opcodes_h_l406_c30_164f
sp_relative_shift_uxn_opcodes_h_l406_c30_164f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins,
sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x,
sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y,
sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr,
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc
device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc
result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output);

-- device_in_uxn_opcodes_h_l411_c23_72c5
device_in_uxn_opcodes_h_l411_c23_72c5 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l411_c23_72c5_device_address,
device_in_uxn_opcodes_h_l411_c23_72c5_phase,
device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read,
device_in_uxn_opcodes_h_l411_c23_72c5_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr,
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96
result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output,
 sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output,
 device_in_uxn_opcodes_h_l411_c23_72c5_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_f01f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_7fc0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6175 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_939a_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_72c5_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_72c5_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_72c5_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8ed4_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_730e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_c604_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l392_l400_DUPLICATE_4b5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l426_l386_DUPLICATE_94c1_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6175 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6175;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_730e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_730e;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_7fc0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_7fc0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l411_c23_72c5_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := t8;
     -- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_0dfa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output := UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c6_161c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l410_c8_939a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_939a_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l403_c11_544c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_left;
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output := BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l417_c23_c604] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_c604_return_output := device_in_result.dei_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_c08a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_f01f_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l392_l400_DUPLICATE_4b5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l392_l400_DUPLICATE_4b5d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50_return_output := result.stack_address_sp_offset;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_f01f_return_output := result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_e929] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_left;
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output := BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l406_c30_164f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_ins;
     sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_x;
     sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output := sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_161c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_c08a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_544c_return_output;
     VAR_device_in_uxn_opcodes_h_l411_c23_72c5_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_e929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l403_l392_l400_DUPLICATE_c5d6_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_939a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l403_l410_l400_l414_DUPLICATE_d625_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l392_l400_DUPLICATE_4b5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l392_l400_DUPLICATE_4b5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_921c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l403_l410_l414_DUPLICATE_4b50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_c604_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l403_l392_l410_l400_DUPLICATE_c5b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l414_l410_l403_l400_l392_DUPLICATE_0263_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_0dfa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_f01f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_f01f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_164f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_db96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_3fb7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l414_c4_db96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output := result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- t8_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output := t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_db96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_af62] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output := UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_db96] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output := has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_db96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_3fb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_af62_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_db96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_db96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_db96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_db96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_db96_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_t8_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- printf_uxn_opcodes_h_l393_c3_6914[uxn_opcodes_h_l393_c3_6914] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l393_c3_6914_uxn_opcodes_h_l393_c3_6914_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- t8_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output := has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- t8_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_bccc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_bccc_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_afd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_afd7_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- device_in[uxn_opcodes_h_l411_c23_72c5] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l411_c23_72c5_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l411_c23_72c5_device_address <= VAR_device_in_uxn_opcodes_h_l411_c23_72c5_device_address;
     device_in_uxn_opcodes_h_l411_c23_72c5_phase <= VAR_device_in_uxn_opcodes_h_l411_c23_72c5_phase;
     device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l411_c23_72c5_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l411_c23_72c5_return_output := device_in_uxn_opcodes_h_l411_c23_72c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_device_in_uxn_opcodes_h_l411_c23_72c5_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l412_c32_8ed4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8ed4_return_output := VAR_device_in_uxn_opcodes_h_l411_c23_72c5_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_8ed4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output := device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_8cdc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_8cdc_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_e166] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_e166_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_e9da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_e9da_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_f01f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l426_l386_DUPLICATE_94c1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l426_l386_DUPLICATE_94c1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f010(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_f01f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_f01f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l426_l386_DUPLICATE_94c1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f010_uxn_opcodes_h_l426_l386_DUPLICATE_94c1_return_output;
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
