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
-- Submodules: 57
entity and_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_edc09f97;
architecture arch of and_0CLK_edc09f97 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l962_c6_681f]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l962_c2_0162]
signal n8_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l962_c2_0162]
signal t8_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_0162]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l967_c11_a70a]
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l967_c7_49cf]
signal n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l967_c7_49cf]
signal t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l967_c7_49cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l970_c11_7d64]
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l970_c7_b067]
signal n8_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l970_c7_b067]
signal t8_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_b067]
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l974_c11_9111]
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l974_c7_2d75]
signal n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_2d75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_7e55]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l977_c7_a386]
signal n8_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_a386]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l980_c32_c640]
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l980_c32_78f6]
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l980_c32_441f]
signal MUX_uxn_opcodes_h_l980_c32_441f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_441f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_441f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_441f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l982_c11_376b]
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l982_c7_f786]
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_f786]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l982_c7_f786]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_f786]
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_f786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l986_c24_eb05]
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_8418]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_34c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_34c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f
BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output);

-- n8_MUX_uxn_opcodes_h_l962_c2_0162
n8_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l962_c2_0162_cond,
n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- t8_MUX_uxn_opcodes_h_l962_c2_0162
t8_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l962_c2_0162_cond,
t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162
result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a
BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left,
BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right,
BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output);

-- n8_MUX_uxn_opcodes_h_l967_c7_49cf
n8_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- t8_MUX_uxn_opcodes_h_l967_c7_49cf
t8_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf
result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64
BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output);

-- n8_MUX_uxn_opcodes_h_l970_c7_b067
n8_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l970_c7_b067_cond,
n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- t8_MUX_uxn_opcodes_h_l970_c7_b067
t8_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l970_c7_b067_cond,
t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067
result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111
BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output);

-- n8_MUX_uxn_opcodes_h_l974_c7_2d75
n8_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75
result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output);

-- n8_MUX_uxn_opcodes_h_l977_c7_a386
n8_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l977_c7_a386_cond,
n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l980_c32_c640
BIN_OP_AND_uxn_opcodes_h_l980_c32_c640 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left,
BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right,
BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6
BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left,
BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right,
BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output);

-- MUX_uxn_opcodes_h_l980_c32_441f
MUX_uxn_opcodes_h_l980_c32_441f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l980_c32_441f_cond,
MUX_uxn_opcodes_h_l980_c32_441f_iftrue,
MUX_uxn_opcodes_h_l980_c32_441f_iffalse,
MUX_uxn_opcodes_h_l980_c32_441f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b
BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786
result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05
BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left,
BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right,
BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output,
 n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output,
 n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output,
 n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output,
 n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output,
 n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output,
 BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output,
 BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output,
 MUX_uxn_opcodes_h_l980_c32_441f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output,
 BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_e5f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_83c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_173a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4445 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_441f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_441f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_441f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_441f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d52f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_c8b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l993_l958_DUPLICATE_19f9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_173a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_173a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_e5f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_e5f7;
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d52f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d52f;
     VAR_MUX_uxn_opcodes_h_l980_c32_441f_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l980_c32_441f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_83c9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_83c9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4445 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4445;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_7e55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l980_c32_c640] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_left;
     BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output := BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l974_c11_9111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_left;
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output := BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c6_681f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l986_c24_eb05] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_left;
     BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output := BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l982_c11_376b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_left;
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output := BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l970_c11_7d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_left;
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output := BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_8418] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l967_c11_a70a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_left;
     BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output := BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_c8b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_c8b6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_c640_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_eb05_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_681f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_a70a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_7d64_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_9111_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7e55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_376b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l977_DUPLICATE_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l974_l970_l967_l988_l982_l977_DUPLICATE_0265_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_DUPLICATE_a91c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l974_l970_l967_l962_l988_l977_DUPLICATE_a265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_c8b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_c8b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l974_l970_l967_l962_l982_l977_DUPLICATE_82f0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l982_c7_f786] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_cond;
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output := result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_f786] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output;

     -- n8_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output := n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l982_c7_f786] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output;

     -- t8_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output := t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_34c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l980_c32_78f6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_left;
     BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output := BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_34c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l980_c32_441f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_78f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_n8_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_34c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_f786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_34c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_f786_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_f786_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- t8_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- MUX[uxn_opcodes_h_l980_c32_441f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l980_c32_441f_cond <= VAR_MUX_uxn_opcodes_h_l980_c32_441f_cond;
     MUX_uxn_opcodes_h_l980_c32_441f_iftrue <= VAR_MUX_uxn_opcodes_h_l980_c32_441f_iftrue;
     MUX_uxn_opcodes_h_l980_c32_441f_iffalse <= VAR_MUX_uxn_opcodes_h_l980_c32_441f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l980_c32_441f_return_output := MUX_uxn_opcodes_h_l980_c32_441f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_f786] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- n8_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_f786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue := VAR_MUX_uxn_opcodes_h_l980_c32_441f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_n8_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_f786_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_f786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_t8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- t8_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output := t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_a386] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- n8_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output := n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l962_c2_0162_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- n8_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_2d75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_n8_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_2d75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- n8_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output := n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_b067] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l962_c2_0162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_b067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l967_c7_49cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_49cf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_0162] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l993_l958_DUPLICATE_19f9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l993_l958_DUPLICATE_19f9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_0162_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_0162_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l993_l958_DUPLICATE_19f9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l993_l958_DUPLICATE_19f9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
