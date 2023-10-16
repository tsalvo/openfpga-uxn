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
entity dei_0CLK_540d7a59 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei_0CLK_540d7a59;
architecture arch of dei_0CLK_540d7a59 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l419_c6_201e]
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c1_85c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l427_c7_5d19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l419_c2_0df6]
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l419_c2_0df6]
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : device_in_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l419_c2_0df6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l419_c2_0df6]
signal t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l420_c3_ce6e[uxn_opcodes_h_l420_c3_ce6e]
signal printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l427_c11_a4ab]
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_f59f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l427_c7_5d19]
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l427_c7_5d19]
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l427_c7_5d19]
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l427_c7_5d19]
signal t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l430_c11_8f1e]
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_b64c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_f59f]
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l430_c7_f59f]
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l430_c7_f59f]
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l430_c7_f59f]
signal t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l433_c30_7c39]
signal sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l437_c8_c224]
signal UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l437_c1_0b88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : device_in_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l437_c3_ffcc]
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l438_c37_af1c]
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l438_c23_9dd0]
signal device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_9dd0_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_9dd0_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l438_c23_9dd0_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l441_c9_9f94]
signal UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l441_c4_7bea]
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c4_7bea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l441_c4_7bea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l441_c4_7bea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l441_c4_7bea]
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.device_ram_address := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e
BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left,
BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right,
BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6
device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6
result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- t8_MUX_uxn_opcodes_h_l419_c2_0df6
t8_MUX_uxn_opcodes_h_l419_c2_0df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond,
t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue,
t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse,
t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

-- printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e
printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e : entity work.printf_uxn_opcodes_h_l420_c3_ce6e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab
BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left,
BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right,
BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19
device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19
result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- t8_MUX_uxn_opcodes_h_l427_c7_5d19
t8_MUX_uxn_opcodes_h_l427_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond,
t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue,
t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse,
t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e
BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right,
BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f
device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f
result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- t8_MUX_uxn_opcodes_h_l430_c7_f59f
t8_MUX_uxn_opcodes_h_l430_c7_f59f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond,
t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue,
t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse,
t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l433_c30_7c39
sp_relative_shift_uxn_opcodes_h_l433_c30_7c39 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins,
sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x,
sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y,
sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr,
UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc
device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc
result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left,
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right,
BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output);

-- device_in_uxn_opcodes_h_l438_c23_9dd0
device_in_uxn_opcodes_h_l438_c23_9dd0 : entity work.device_in_0CLK_5af1a430 port map (
clk,
device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l438_c23_9dd0_device_address,
device_in_uxn_opcodes_h_l438_c23_9dd0_phase,
device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read,
device_in_uxn_opcodes_h_l438_c23_9dd0_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr,
UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea
result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output,
 sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output,
 device_in_uxn_opcodes_h_l438_c23_9dd0_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_0df6_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_4249 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_48df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_a09b_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_e490_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_b57a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6325_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_f3fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6_uxn_opcodes_h_l453_l413_DUPLICATE_f04c_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_b57a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l443_c5_b57a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right := to_unsigned(1, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_4249 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_4249;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_48df := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l428_c3_48df;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l419_c6_201e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_left;
     BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output := BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l437_c8_a09b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_a09b_return_output := device_in_result.is_dei_done;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_0df6_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l430_c11_8f1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_f3fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_f3fa_return_output := result.is_sp_shift;

     -- UNARY_OP_NOT[uxn_opcodes_h_l441_c9_9f94] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output := UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l433_c30_7c39] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_ins;
     sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_x;
     sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y <= VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output := sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l427_c11_a4ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l444_c23_6325] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6325_return_output := device_in_result.dei_value;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_0df6_return_output := result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l438_c37_af1c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c6_201e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l427_c11_a4ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l430_c11_8f1e_return_output;
     VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l438_c37_af1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l419_l430_l427_DUPLICATE_81fb_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l437_c8_a09b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l437_l430_l427_l441_DUPLICATE_d4c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_f3fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l419_l427_DUPLICATE_f3fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_cac0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l437_l430_l441_DUPLICATE_b032_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l444_c23_6325_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l437_l419_l430_l427_DUPLICATE_e30c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l437_l427_l441_l419_l430_DUPLICATE_f967_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l441_c9_9f94_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l419_c2_0df6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l419_c2_0df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l433_c30_7c39_return_output;
     -- t8_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l441_c4_7bea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c1_85c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l441_c4_7bea] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output := has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l441_c4_7bea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output := result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l441_c4_7bea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l437_c8_c224] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output := UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l441_c4_7bea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c1_85c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l437_c8_c224_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l441_c4_7bea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_t8_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     -- t8_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- printf_uxn_opcodes_h_l420_c3_ce6e[uxn_opcodes_h_l420_c3_ce6e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l420_c3_ce6e_uxn_opcodes_h_l420_c3_ce6e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l435_c1_b64c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output;

     -- t8_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l435_c1_b64c_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l437_c1_0b88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l437_c1_0b88_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- device_in[uxn_opcodes_h_l438_c23_9dd0] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l438_c23_9dd0_device_address <= VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_device_address;
     device_in_uxn_opcodes_h_l438_c23_9dd0_phase <= VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_phase;
     device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_return_output := device_in_uxn_opcodes_h_l438_c23_9dd0_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l439_c32_e490] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_e490_return_output := VAR_device_in_uxn_opcodes_h_l438_c23_9dd0_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c32_e490_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l437_c3_ffcc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l437_c3_ffcc_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l430_c7_f59f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l430_c7_f59f_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l427_c7_5d19] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l427_c7_5d19_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l419_c2_0df6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6_uxn_opcodes_h_l453_l413_DUPLICATE_f04c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6_uxn_opcodes_h_l453_l413_DUPLICATE_f04c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l419_c2_0df6_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c2_0df6_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6_uxn_opcodes_h_l453_l413_DUPLICATE_f04c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6ba6_uxn_opcodes_h_l453_l413_DUPLICATE_f04c_return_output;
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
