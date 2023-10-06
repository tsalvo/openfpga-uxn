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
-- BIN_OP_EQ[uxn_opcodes_h_l456_c6_1f04]
signal BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l456_c1_e92b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_7645]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l456_c2_56f5]
signal t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l456_c2_56f5]
signal has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l456_c2_56f5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l456_c2_56f5]
signal device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : device_in_result_t;

-- printf_uxn_opcodes_h_l457_c3_7be4[uxn_opcodes_h_l457_c3_7be4]
signal printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l464_c11_31fa]
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l464_c7_7645]
signal t8_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l464_c7_7645]
signal has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_7645]
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l464_c7_7645]
signal device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_e25e]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_39d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_bfa6]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : device_in_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l471_c32_b203]
signal BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l471_c32_fbc3]
signal BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l471_c32_b1b6]
signal MUX_uxn_opcodes_h_l471_c32_b1b6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l471_c32_b1b6_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l475_c8_1fd4]
signal UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c1_e092]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l475_c3_5ad3]
signal device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : device_in_result_t;

-- BIN_OP_MINUS[uxn_opcodes_h_l476_c37_ca87]
signal BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l476_c23_6d41]
signal device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l476_c23_6d41_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l476_c23_6d41_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l476_c23_6d41_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l480_c9_57fd]
signal UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l480_c4_9125]
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l480_c4_9125]
signal result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l480_c4_9125]
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c4_9125]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l480_c4_9125]
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l480_c4_9125]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_febe( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_device_ram_read := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04
BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left,
BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right,
BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- t8_MUX_uxn_opcodes_h_l456_c2_56f5
t8_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5
has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5
result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5
result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5
result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5
result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5
result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5
result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5
result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5
device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond,
device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue,
device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse,
device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

-- printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4
printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4 : entity work.printf_uxn_opcodes_h_l457_c3_7be4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa
BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- t8_MUX_uxn_opcodes_h_l464_c7_7645
t8_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l464_c7_7645_cond,
t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645
has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond,
has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645
result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645
result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l464_c7_7645
device_in_result_MUX_uxn_opcodes_h_l464_c7_7645 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond,
device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue,
device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse,
device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e
BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_bfa6
t8_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6
has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6
result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6
device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l471_c32_b203
BIN_OP_AND_uxn_opcodes_h_l471_c32_b203 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left,
BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right,
BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3
BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left,
BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right,
BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output);

-- MUX_uxn_opcodes_h_l471_c32_b1b6
MUX_uxn_opcodes_h_l471_c32_b1b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l471_c32_b1b6_cond,
MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue,
MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse,
MUX_uxn_opcodes_h_l471_c32_b1b6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4
UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr,
UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3
has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3
result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3
device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond,
device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue,
device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse,
device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87
BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left,
BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right,
BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output);

-- device_in_uxn_opcodes_h_l476_c23_6d41
device_in_uxn_opcodes_h_l476_c23_6d41 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l476_c23_6d41_device_address,
device_in_uxn_opcodes_h_l476_c23_6d41_phase,
device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read,
device_in_uxn_opcodes_h_l476_c23_6d41_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd
UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr,
UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125
has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond,
has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125
result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond,
result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125
result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125
result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125
result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output,
 BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output,
 MUX_uxn_opcodes_h_l471_c32_b1b6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output,
 device_in_uxn_opcodes_h_l476_c23_6d41_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_f960 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l456_c2_56f5_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_6475 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c8_767b_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l476_c23_6d41_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l476_c23_6d41_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l476_c23_6d41_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l477_c32_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l478_c32_b518_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l483_c5_ee9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l484_c26_6c47_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l464_l456_DUPLICATE_f42d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l464_l467_DUPLICATE_f354_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l450_l493_DUPLICATE_3611_return_output : opcode_result_t;
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
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_f960 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_f960;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_6475 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_6475;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l483_c5_ee9b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l483_c5_ee9b;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l476_c23_6d41_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l484_c26_6c47] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l484_c26_6c47_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l456_c6_1f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_left;
     BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output := BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c8_767b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c8_767b_return_output := device_in_result.is_dei_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_e25e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l464_c11_31fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8_return_output := result.sp_relative_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l480_c9_57fd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output := UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output := result.is_opc_done;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l456_c2_56f5_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_MINUS[uxn_opcodes_h_l476_c37_ca87] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_left;
     BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output := BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l471_c32_b203] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_left;
     BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output := BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l464_l467_DUPLICATE_f354 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l464_l467_DUPLICATE_f354_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l464_l456_DUPLICATE_f42d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l464_l456_DUPLICATE_f42d_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l471_c32_b203_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l456_c6_1f04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_31fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_e25e_return_output;
     VAR_device_in_uxn_opcodes_h_l476_c23_6d41_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l476_c37_ca87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l464_l467_l456_DUPLICATE_65b8_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c8_767b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l464_l480_l467_l456_DUPLICATE_1360_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l464_l480_l467_l475_DUPLICATE_2803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l464_l456_DUPLICATE_f42d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l464_l456_DUPLICATE_f42d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l464_l467_DUPLICATE_f354_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l464_l467_DUPLICATE_f354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_2751_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l484_c26_6c47_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_l467_l456_l475_DUPLICATE_995d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l480_l467_l475_DUPLICATE_a819_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l480_l475_l467_l464_l456_DUPLICATE_a817_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l480_c9_57fd_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l456_c2_56f5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l456_c1_e92b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output := result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l475_c8_1fd4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output := UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l480_c4_9125] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output := has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l471_c32_fbc3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_left;
     BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output := BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c32_fbc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l456_c1_e92b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l475_c8_1fd4_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l480_c4_9125_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     -- t8_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output := t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- MUX[uxn_opcodes_h_l471_c32_b1b6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l471_c32_b1b6_cond <= VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_cond;
     MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue <= VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iftrue;
     MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse <= VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_return_output := MUX_uxn_opcodes_h_l471_c32_b1b6_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- printf_uxn_opcodes_h_l457_c3_7be4[uxn_opcodes_h_l457_c3_7be4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l457_c3_7be4_uxn_opcodes_h_l457_c3_7be4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue := VAR_MUX_uxn_opcodes_h_l471_c32_b1b6_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l473_c1_39d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- t8_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l473_c1_39d2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output := has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l475_c1_e092] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l475_c1_e092_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     -- has_written_to_t_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- device_in[uxn_opcodes_h_l476_c23_6d41] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l476_c23_6d41_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l476_c23_6d41_device_address <= VAR_device_in_uxn_opcodes_h_l476_c23_6d41_device_address;
     device_in_uxn_opcodes_h_l476_c23_6d41_phase <= VAR_device_in_uxn_opcodes_h_l476_c23_6d41_phase;
     device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l476_c23_6d41_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l476_c23_6d41_return_output := device_in_uxn_opcodes_h_l476_c23_6d41_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_device_in_uxn_opcodes_h_l476_c23_6d41_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;
     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l477_c32_3ca1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l477_c32_3ca1_return_output := VAR_device_in_uxn_opcodes_h_l476_c23_6d41_return_output.is_device_ram_read;

     -- device_in_result_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l478_c32_b518] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l478_c32_b518_return_output := VAR_device_in_uxn_opcodes_h_l476_c23_6d41_return_output.device_ram_address;

     -- Submodule level 7
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l477_c32_3ca1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l478_c32_b518_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l475_c3_5ad3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l475_c3_5ad3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output := device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l467_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l467_c7_bfa6_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_7645] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_7645_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l456_c2_56f5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l450_l493_DUPLICATE_3611 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l450_l493_DUPLICATE_3611_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_febe(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l456_c2_56f5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l450_l493_DUPLICATE_3611_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_febe_uxn_opcodes_h_l450_l493_DUPLICATE_3611_return_output;
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