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
-- BIN_OP_EQ[uxn_opcodes_h_l442_c6_7a0e]
signal BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_b223]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_0819]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : device_in_result_t;

-- result_is_stack_read_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l442_c2_cfcd]
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l443_c3_877a[uxn_opcodes_h_l443_c3_877a]
signal printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l450_c11_1cab]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l453_c7_10b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c7_0819]
signal t8_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c7_0819]
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output : device_in_result_t;

-- result_is_stack_read_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l450_c7_0819]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_0819]
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l453_c11_ae08]
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l459_c1_a407]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l453_c7_10b7]
signal t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l453_c7_10b7]
signal device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : device_in_result_t;

-- result_is_stack_read_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l453_c7_10b7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l453_c7_10b7]
signal has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l457_c32_b8d2]
signal BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l457_c32_dad4]
signal BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l457_c32_2613]
signal MUX_uxn_opcodes_h_l457_c32_2613_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l457_c32_2613_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c32_2613_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l457_c32_2613_return_output : signed(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l461_c8_dd04]
signal UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c1_fefd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l461_c3_3263]
signal device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c3_3263]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l461_c3_3263]
signal has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l462_c37_42f1]
signal BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l462_c23_f177]
signal device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l462_c23_f177_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l462_c23_f177_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l462_c23_f177_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l466_c9_76cf]
signal UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l466_c4_2de6]
signal result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l466_c4_2de6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l466_c4_2de6]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l466_c4_2de6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l466_c4_2de6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(7 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l466_c4_2de6]
signal has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_17a0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
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
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_device_ram_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e
BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left,
BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right,
BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- t8_MUX_uxn_opcodes_h_l442_c2_cfcd
t8_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd
device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd
result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd
result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd
result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd
result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd
result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd
result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd
result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd
has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond,
has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

-- printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a
printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a : entity work.printf_uxn_opcodes_h_l443_c3_877a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab
BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c7_0819
t8_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c7_0819_cond,
t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c7_0819
device_in_result_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819
result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819
result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819
result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08
BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output);

-- t8_MUX_uxn_opcodes_h_l453_c7_10b7
t8_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7
device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7
result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7
result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7
result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7
result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7
result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7
has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond,
has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2
BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left,
BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right,
BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4
BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left,
BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right,
BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output);

-- MUX_uxn_opcodes_h_l457_c32_2613
MUX_uxn_opcodes_h_l457_c32_2613 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l457_c32_2613_cond,
MUX_uxn_opcodes_h_l457_c32_2613_iftrue,
MUX_uxn_opcodes_h_l457_c32_2613_iffalse,
MUX_uxn_opcodes_h_l457_c32_2613_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04
UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr,
UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l461_c3_3263
device_in_result_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond,
device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263
result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263
result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263
result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263
result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263
has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond,
has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1
BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left,
BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right,
BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output);

-- device_in_uxn_opcodes_h_l462_c23_f177
device_in_uxn_opcodes_h_l462_c23_f177 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l462_c23_f177_device_address,
device_in_uxn_opcodes_h_l462_c23_f177_phase,
device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read,
device_in_uxn_opcodes_h_l462_c23_f177_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf
UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr,
UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6
result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6
result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6
result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6
has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond,
has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output,
 t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output,
 MUX_uxn_opcodes_h_l457_c32_2613_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output,
 device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output,
 device_in_uxn_opcodes_h_l462_c23_f177_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l442_c2_cfcd_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c3_7315 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l451_c3_bd5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c32_2613_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c32_2613_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c32_2613_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l457_c32_2613_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l461_c8_5d65_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l462_c23_f177_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l462_c23_f177_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l462_c23_f177_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_c32_60d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_c32_04dc_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c5_29c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l470_c26_f7d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l442_l450_DUPLICATE_2052_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l450_l453_DUPLICATE_51eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l479_l436_DUPLICATE_b649_return_output : opcode_result_t;
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
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right := to_unsigned(128, 8);
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l451_c3_bd5c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l451_c3_bd5c;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c5_29c6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c5_29c6;
     VAR_MUX_uxn_opcodes_h_l457_c32_2613_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l457_c32_2613_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c3_7315 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l446_c3_7315;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := has_written_to_t;
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l462_c23_f177_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l442_l450_DUPLICATE_2052 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l442_l450_DUPLICATE_2052_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l457_c32_b8d2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_left;
     BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output := BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l462_c37_42f1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l442_c6_7a0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l461_c8_5d65] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l461_c8_5d65_return_output := device_in_result.is_dei_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd_return_output := result.stack_address_sp_offset;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l442_c2_cfcd_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l450_l453_DUPLICATE_51eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l450_l453_DUPLICATE_51eb_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l470_c26_f7d0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l470_c26_f7d0_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90_return_output := result.sp_relative_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l466_c9_76cf] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output := UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l453_c11_ae08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_left;
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output := BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c11_1cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l457_c32_b8d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l442_c6_7a0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c11_1cab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_ae08_return_output;
     VAR_device_in_uxn_opcodes_h_l462_c23_f177_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l462_c37_42f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l442_l450_l453_DUPLICATE_5d90_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l461_c8_5d65_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l442_l450_l466_l453_DUPLICATE_9695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l461_l450_l466_l453_DUPLICATE_134a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l442_l450_DUPLICATE_2052_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l442_l450_DUPLICATE_2052_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l450_l453_DUPLICATE_51eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l450_l453_DUPLICATE_51eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_66d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l470_c26_f7d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l442_l461_l450_l453_DUPLICATE_69bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l461_l466_l453_DUPLICATE_55cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l442_l466_l461_l453_l450_DUPLICATE_b720_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l466_c9_76cf_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l442_c2_cfcd_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l457_c32_dad4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_left;
     BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output := BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l461_c8_dd04] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output := UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- t8_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l466_c4_2de6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l442_c1_b223] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l457_c32_2613_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l457_c32_dad4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l442_c1_b223_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l461_c8_dd04_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l466_c4_2de6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_t8_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- printf_uxn_opcodes_h_l443_c3_877a[uxn_opcodes_h_l443_c3_877a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l443_c3_877a_uxn_opcodes_h_l443_c3_877a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- has_written_to_t_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output := has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output := t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- MUX[uxn_opcodes_h_l457_c32_2613] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l457_c32_2613_cond <= VAR_MUX_uxn_opcodes_h_l457_c32_2613_cond;
     MUX_uxn_opcodes_h_l457_c32_2613_iftrue <= VAR_MUX_uxn_opcodes_h_l457_c32_2613_iftrue;
     MUX_uxn_opcodes_h_l457_c32_2613_iffalse <= VAR_MUX_uxn_opcodes_h_l457_c32_2613_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l457_c32_2613_return_output := MUX_uxn_opcodes_h_l457_c32_2613_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue := VAR_MUX_uxn_opcodes_h_l457_c32_2613_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l459_c1_a407] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- t8_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l459_c1_a407_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c1_fefd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output := has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c1_fefd_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- device_in[uxn_opcodes_h_l462_c23_f177] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l462_c23_f177_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l462_c23_f177_device_address <= VAR_device_in_uxn_opcodes_h_l462_c23_f177_device_address;
     device_in_uxn_opcodes_h_l462_c23_f177_phase <= VAR_device_in_uxn_opcodes_h_l462_c23_f177_phase;
     device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l462_c23_f177_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l462_c23_f177_return_output := device_in_uxn_opcodes_h_l462_c23_f177_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_device_in_uxn_opcodes_h_l462_c23_f177_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output := device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l464_c32_04dc] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_c32_04dc_return_output := VAR_device_in_uxn_opcodes_h_l462_c23_f177_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l463_c32_60d1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_c32_60d1_return_output := VAR_device_in_uxn_opcodes_h_l462_c23_f177_return_output.is_device_ram_read;

     -- Submodule level 7
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l463_c32_60d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l464_c32_04dc_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l461_c3_3263] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c3_3263_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l453_c7_10b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l453_c7_10b7_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l450_c7_0819] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l450_c7_0819_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l442_c2_cfcd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l479_l436_DUPLICATE_b649 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l479_l436_DUPLICATE_b649_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_17a0(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l442_c2_cfcd_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l479_l436_DUPLICATE_b649_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_17a0_uxn_opcodes_h_l479_l436_DUPLICATE_b649_return_output;
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
