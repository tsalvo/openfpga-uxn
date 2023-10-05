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
-- Submodules: 64
entity ora_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_fd2391e7;
architecture arch of ora_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l938_c6_cbe7]
signal BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l938_c1_2e81]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l938_c2_6e24]
signal n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l938_c2_6e24]
signal t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l938_c2_6e24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l939_c3_e31a[uxn_opcodes_h_l939_c3_e31a]
signal printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_be18]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l944_c7_faa2]
signal n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l944_c7_faa2]
signal t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_faa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l947_c11_c738]
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l947_c7_a607]
signal n8_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l947_c7_a607]
signal t8_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_a607]
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l951_c11_2643]
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l951_c7_d83c]
signal n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_d83c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l954_c11_331c]
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l954_c7_4631]
signal n8_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_4631]
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l958_c32_f33a]
signal BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l958_c32_b10c]
signal BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l958_c32_c8f7]
signal MUX_uxn_opcodes_h_l958_c32_c8f7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l958_c32_c8f7_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_da81]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l960_c7_4aa3]
signal result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_4aa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l960_c7_4aa3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_4aa3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_4aa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l964_c24_0813]
signal BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l966_c11_6cba]
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_29c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_29c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7
BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left,
BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right,
BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output);

-- n8_MUX_uxn_opcodes_h_l938_c2_6e24
n8_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- t8_MUX_uxn_opcodes_h_l938_c2_6e24
t8_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24
result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24
result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24
result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24
result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24
result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24
result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

-- printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a
printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a : entity work.printf_uxn_opcodes_h_l939_c3_e31a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18
BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output);

-- n8_MUX_uxn_opcodes_h_l944_c7_faa2
n8_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- t8_MUX_uxn_opcodes_h_l944_c7_faa2
t8_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2
result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738
BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output);

-- n8_MUX_uxn_opcodes_h_l947_c7_a607
n8_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l947_c7_a607_cond,
n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- t8_MUX_uxn_opcodes_h_l947_c7_a607
t8_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l947_c7_a607_cond,
t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607
result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643
BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output);

-- n8_MUX_uxn_opcodes_h_l951_c7_d83c
n8_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c
result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c
BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output);

-- n8_MUX_uxn_opcodes_h_l954_c7_4631
n8_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l954_c7_4631_cond,
n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631
result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a
BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left,
BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right,
BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c
BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left,
BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right,
BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output);

-- MUX_uxn_opcodes_h_l958_c32_c8f7
MUX_uxn_opcodes_h_l958_c32_c8f7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l958_c32_c8f7_cond,
MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue,
MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse,
MUX_uxn_opcodes_h_l958_c32_c8f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81
BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3
result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond,
result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3
result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l964_c24_0813
BIN_OP_OR_uxn_opcodes_h_l964_c24_0813 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left,
BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right,
BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba
BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output,
 n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output,
 n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output,
 n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output,
 n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output,
 n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output,
 BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output,
 MUX_uxn_opcodes_h_l958_c32_c8f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a9c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_6615 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_ec9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_d1e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_6dd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l960_l954_DUPLICATE_e493_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l971_l934_DUPLICATE_4cce_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_ec9d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_ec9d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_6dd5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_6dd5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_d1e0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_d1e0;
     VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a9c7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a9c7;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_6615 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_6615;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l960_l954_DUPLICATE_e493 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l960_l954_DUPLICATE_e493_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l958_c32_f33a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_left;
     BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output := BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l951_c11_2643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_left;
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output := BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l966_c11_6cba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_left;
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output := BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l954_c11_331c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_left;
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output := BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l938_c6_cbe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output := result.sp_relative_shift;

     -- BIN_OP_OR[uxn_opcodes_h_l964_c24_0813] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_left;
     BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output := BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_be18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_da81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l947_c11_c738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_left;
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output := BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l958_c32_f33a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c6_cbe7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_be18_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_c738_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_2643_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_331c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_da81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_6cba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l964_c24_0813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l947_l944_l938_l954_l951_DUPLICATE_9c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l947_l944_l966_l960_l954_l951_DUPLICATE_98c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l944_l938_l960_l951_DUPLICATE_3965_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l947_l951_l944_l954_DUPLICATE_cf31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l947_l944_l938_l966_l954_l951_DUPLICATE_7819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l960_l954_DUPLICATE_e493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l960_l954_DUPLICATE_e493_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l947_l944_l938_l960_l954_l951_DUPLICATE_a21a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_29c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l938_c1_2e81] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_4aa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_29c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output := t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l960_c7_4aa3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output := result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l960_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l958_c32_b10c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_left;
     BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output := BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output;

     -- n8_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output := n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l958_c32_b10c_return_output;
     VAR_printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l938_c1_2e81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_29c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_29c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     -- MUX[uxn_opcodes_h_l958_c32_c8f7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l958_c32_c8f7_cond <= VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_cond;
     MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue <= VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iftrue;
     MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse <= VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_return_output := MUX_uxn_opcodes_h_l958_c32_c8f7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;

     -- n8_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- t8_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- printf_uxn_opcodes_h_l939_c3_e31a[uxn_opcodes_h_l939_c3_e31a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l939_c3_e31a_uxn_opcodes_h_l939_c3_e31a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue := VAR_MUX_uxn_opcodes_h_l958_c32_c8f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_n8_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_4aa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_t8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- t8_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- n8_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output := n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_4631] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_4631_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;
     -- n8_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_d83c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_n8_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_d83c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- n8_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_a607] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_a607_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_faa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_faa2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l938_c2_6e24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l971_l934_DUPLICATE_4cce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l971_l934_DUPLICATE_4cce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c2_6e24_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c2_6e24_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l971_l934_DUPLICATE_4cce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l971_l934_DUPLICATE_4cce_return_output;
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
