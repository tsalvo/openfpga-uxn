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
-- BIN_OP_EQ[uxn_opcodes_h_l392_c6_debd]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_b9c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_340f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l392_c2_3a06]
signal t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l392_c2_3a06]
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : device_in_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_3a06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : signed(3 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_3a06]
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l393_c3_8708[uxn_opcodes_h_l393_c3_8708]
signal printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_9891]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l400_c7_340f]
signal t8_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l400_c7_340f]
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_340f]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_340f]
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l403_c11_bace]
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_b4aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_6d7b]
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l406_c30_df9a]
signal sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_59de]
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_00d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l410_c3_ff33]
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_ff33]
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_ff33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_ff33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_ff33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l410_c3_ff33]
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_ff33]
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_7ed2]
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l411_c23_def6]
signal device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_def6_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_def6_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l411_c23_def6_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_efbf]
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_7909]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_7909]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_7909]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l414_c4_7909]
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_7909]
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e671( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd
BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- t8_MUX_uxn_opcodes_h_l392_c2_3a06
t8_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06
device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

-- printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708
printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708 : entity work.printf_uxn_opcodes_h_l393_c3_8708_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891
BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- t8_MUX_uxn_opcodes_h_l400_c7_340f
t8_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l400_c7_340f_cond,
t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l400_c7_340f
device_in_result_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond,
device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f
result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace
BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right,
BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output);

-- t8_MUX_uxn_opcodes_h_l403_c7_6d7b
t8_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b
device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b
result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l406_c30_df9a
sp_relative_shift_uxn_opcodes_h_l406_c30_df9a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins,
sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x,
sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y,
sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr,
UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33
device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33
result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right,
BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output);

-- device_in_uxn_opcodes_h_l411_c23_def6
device_in_uxn_opcodes_h_l411_c23_def6 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l411_c23_def6_device_address,
device_in_uxn_opcodes_h_l411_c23_def6_phase,
device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read,
device_in_uxn_opcodes_h_l411_c23_def6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr,
UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909
result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output,
 t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output,
 sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output,
 device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output,
 device_in_uxn_opcodes_h_l411_c23_def6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3a06_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_01c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6259 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_728a_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_def6_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_def6_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l411_c23_def6_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_4898_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_75af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_9938_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_d56f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l426_l386_DUPLICATE_7730_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_01c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_01c8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_75af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c5_75af;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6259 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_6259;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l411_c23_def6_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l410_c8_728a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_728a_return_output := device_in_result.is_dei_done;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3a06_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_d56f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_d56f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l417_c23_9938] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_9938_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output := result.device_ram_address;

     -- sp_relative_shift[uxn_opcodes_h_l406_c30_df9a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_ins;
     sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_x;
     sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output := sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c6_debd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l414_c9_efbf] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output := UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3a06_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_9891] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l411_c37_7ed2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_left;
     BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output := BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l403_c11_bace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_left;
     BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output := BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c6_debd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_9891_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l403_c11_bace_return_output;
     VAR_device_in_uxn_opcodes_h_l411_c23_def6_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l411_c37_7ed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l400_l403_l392_DUPLICATE_6730_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l410_c8_728a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l410_l400_l414_l403_DUPLICATE_5d59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_d56f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l400_l392_DUPLICATE_d56f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d460_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l410_l414_l403_DUPLICATE_92da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l417_c23_9938_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l410_l400_l403_l392_DUPLICATE_d781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l410_l403_l400_l392_l414_DUPLICATE_9bf9_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l414_c9_efbf_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l392_c2_3a06_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l392_c2_3a06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l406_c30_df9a_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l414_c4_7909] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output := has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c4_7909] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l414_c4_7909] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_cond;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output := result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c4_7909] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l392_c1_b9c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- t8_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l410_c8_59de] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output := UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c4_7909] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l392_c1_b9c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l410_c8_59de_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l414_c4_7909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c4_7909_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c4_7909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c4_7909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l414_c4_7909_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- t8_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output := t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- printf_uxn_opcodes_h_l393_c3_8708[uxn_opcodes_h_l393_c3_8708] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l393_c3_8708_uxn_opcodes_h_l393_c3_8708_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_t8_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- t8_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_b4aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_b4aa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l410_c1_00d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l410_c1_00d8_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- device_in[uxn_opcodes_h_l411_c23_def6] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l411_c23_def6_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l411_c23_def6_device_address <= VAR_device_in_uxn_opcodes_h_l411_c23_def6_device_address;
     device_in_uxn_opcodes_h_l411_c23_def6_phase <= VAR_device_in_uxn_opcodes_h_l411_c23_def6_phase;
     device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l411_c23_def6_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l411_c23_def6_return_output := device_in_uxn_opcodes_h_l411_c23_def6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_device_in_uxn_opcodes_h_l411_c23_def6_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l412_c32_4898] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_4898_return_output := VAR_device_in_uxn_opcodes_h_l411_c23_def6_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l412_c32_4898_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l410_c3_ff33] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l410_c3_ff33_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output := device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l403_c7_6d7b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l403_c7_6d7b_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l400_c7_340f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l400_c7_340f_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l392_c2_3a06] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l426_l386_DUPLICATE_7730 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l426_l386_DUPLICATE_7730_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e671(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c2_3a06_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l392_c2_3a06_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l426_l386_DUPLICATE_7730_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e671_uxn_opcodes_h_l426_l386_DUPLICATE_7730_return_output;
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
