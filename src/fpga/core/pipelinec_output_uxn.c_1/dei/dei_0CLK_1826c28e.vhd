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
-- BIN_OP_EQ[uxn_opcodes_h_l386_c6_be5f]
signal BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l386_c1_4430]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l386_c2_33b8]
signal has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l386_c2_33b8]
signal t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l386_c2_33b8]
signal device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l386_c2_33b8]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l387_c3_94ab[uxn_opcodes_h_l387_c3_94ab]
signal printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l394_c11_0272]
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l397_c7_6336]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l394_c7_2fb1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l397_c11_30d2]
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l402_c1_eb8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l397_c7_6336]
signal has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l397_c7_6336]
signal t8_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l397_c7_6336]
signal device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l397_c7_6336]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l400_c30_e44e]
signal sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output : signed(3 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l404_c8_591a]
signal UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l404_c1_8a4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : device_in_result_t;

-- result_device_ram_address_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l404_c3_7ae3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l405_c37_4897]
signal BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l405_c23_77e9]
signal device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l405_c23_77e9_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l405_c23_77e9_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l405_c23_77e9_return_output : device_in_result_t;

-- UNARY_OP_NOT[uxn_opcodes_h_l408_c9_7570]
signal UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output : unsigned(0 downto 0);

-- has_written_to_t_MUX[uxn_opcodes_h_l408_c4_df75]
signal has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
signal has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c4_df75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c4_df75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c4_df75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l408_c4_df75]
signal result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c44( ref_toks_0 : opcode_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f
BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left,
BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right,
BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8
has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- t8_MUX_uxn_opcodes_h_l386_c2_33b8
t8_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8
device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8
result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8
result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8
result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8
result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8
result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8
result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

-- printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab
printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab : entity work.printf_uxn_opcodes_h_l387_c3_94ab_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272
BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1
has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- t8_MUX_uxn_opcodes_h_l394_c7_2fb1
t8_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1
device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1
result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1
result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1
result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2
BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336
has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond,
has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- t8_MUX_uxn_opcodes_h_l397_c7_6336
t8_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l397_c7_6336_cond,
t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l397_c7_6336
device_in_result_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond,
device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336
result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336
result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336
result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336
result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output);

-- sp_relative_shift_uxn_opcodes_h_l400_c30_e44e
sp_relative_shift_uxn_opcodes_h_l400_c30_e44e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins,
sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x,
sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y,
sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a
UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3
has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3
device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3
result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3
result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3
result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3
result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897
BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left,
BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right,
BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output);

-- device_in_uxn_opcodes_h_l405_c23_77e9
device_in_uxn_opcodes_h_l405_c23_77e9 : entity work.device_in_0CLK_b9b05a79 port map (
clk,
device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l405_c23_77e9_device_address,
device_in_uxn_opcodes_h_l405_c23_77e9_phase,
device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read,
device_in_uxn_opcodes_h_l405_c23_77e9_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570
UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr,
UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output);

-- has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75
has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond,
has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue,
has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse,
has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75
result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75
result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75
result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond,
result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output,
 sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output,
 device_in_uxn_opcodes_h_l405_c23_77e9_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output,
 has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l386_c2_33b8_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a27c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_aa94 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l404_c8_20a0_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l405_c23_77e9_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l405_c23_77e9_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l405_c23_77e9_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l406_c32_0590_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
 variable VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c5_c4d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l411_c23_b858_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l394_l386_DUPLICATE_06ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l380_l420_DUPLICATE_851a_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_aa94 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_aa94;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c5_c4d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c5_c4d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a27c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a27c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse := to_unsigned(0, 1);
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := device_in_result;
     VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := device_in_result;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := has_written_to_t;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse := has_written_to_t;
     VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l405_c23_77e9_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l394_c11_0272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_left;
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output := BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l386_c6_be5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l404_c8_20a0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l404_c8_20a0_return_output := device_in_result.is_dei_done;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l386_c2_33b8_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output := result.device_ram_address;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l386_c2_33b8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_MINUS[uxn_opcodes_h_l405_c37_4897] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_left;
     BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output := BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l408_c9_7570] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output := UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l394_l386_DUPLICATE_06ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l394_l386_DUPLICATE_06ff_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l411_c23_b858] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l411_c23_b858_return_output := device_in_result.dei_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l400_c30_e44e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_ins;
     sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_x;
     sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output := sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l397_c11_30d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c6_be5f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_0272_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_30d2_return_output;
     VAR_device_in_uxn_opcodes_h_l405_c23_77e9_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l405_c37_4897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l394_l397_l386_DUPLICATE_3e2c_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l404_c8_20a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l394_l408_l397_l404_DUPLICATE_f456_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l394_l386_DUPLICATE_06ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l394_l386_DUPLICATE_06ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_2131_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l408_l397_l404_DUPLICATE_c56e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l411_c23_b858_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l394_l397_l386_l404_DUPLICATE_f3f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l394_l386_l408_l404_l397_DUPLICATE_023f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l408_c9_7570_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l386_c2_33b8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l386_c2_33b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l400_c30_e44e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c4_df75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l408_c4_df75] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_cond;
     result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output := result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l404_c8_591a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c4_df75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output;

     -- t8_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output := t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l408_c4_df75] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output := has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c4_df75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l386_c1_4430] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l386_c1_4430_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond := VAR_UNARY_OP_NOT_uxn_opcodes_h_l404_c8_591a_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l408_c4_df75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c4_df75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c4_df75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c4_df75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l408_c4_df75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- printf_uxn_opcodes_h_l387_c3_94ab[uxn_opcodes_h_l387_c3_94ab] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l387_c3_94ab_uxn_opcodes_h_l387_c3_94ab_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- t8_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l402_c1_eb8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output;

     -- t8_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output := has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l402_c1_eb8d_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l404_c1_8a4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- Submodule level 5
     VAR_device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l404_c1_8a4f_return_output;
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_has_written_to_t_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     -- device_in[uxn_opcodes_h_l405_c23_77e9] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l405_c23_77e9_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l405_c23_77e9_device_address <= VAR_device_in_uxn_opcodes_h_l405_c23_77e9_device_address;
     device_in_uxn_opcodes_h_l405_c23_77e9_phase <= VAR_device_in_uxn_opcodes_h_l405_c23_77e9_phase;
     device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l405_c23_77e9_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l405_c23_77e9_return_output := device_in_uxn_opcodes_h_l405_c23_77e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- has_written_to_t_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- Submodule level 6
     VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_device_in_uxn_opcodes_h_l405_c23_77e9_return_output;
     REG_VAR_has_written_to_t := VAR_has_written_to_t_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l406_c32_0590] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l406_c32_0590_return_output := VAR_device_in_uxn_opcodes_h_l405_c23_77e9_return_output.device_ram_address;

     -- device_in_result_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- Submodule level 7
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l406_c32_0590_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l404_c3_7ae3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output := device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- Submodule level 8
     VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l404_c3_7ae3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l397_c7_6336] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- Submodule level 9
     VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l397_c7_6336_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l394_c7_2fb1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- Submodule level 10
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l394_c7_2fb1_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l386_c2_33b8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l380_l420_DUPLICATE_851a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l380_l420_DUPLICATE_851a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c44(
     result,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l386_c2_33b8_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l386_c2_33b8_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l380_l420_DUPLICATE_851a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c44_uxn_opcodes_h_l380_l420_DUPLICATE_851a_return_output;
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
