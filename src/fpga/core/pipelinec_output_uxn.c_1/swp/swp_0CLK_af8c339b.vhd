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
-- Submodules: 61
entity swp_0CLK_af8c339b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_af8c339b;
architecture arch of swp_0CLK_af8c339b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2782_c6_2bd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2782_c2_2037]
signal n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2782_c2_2037]
signal t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2782_c2_2037]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_6480]
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2787_c7_c6cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_fc2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_6f21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_266c]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_0ea9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_2e24]
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_dd48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2800_c32_25ff]
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2800_c32_ad19]
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2800_c32_9066]
signal MUX_uxn_opcodes_h_l2800_c32_9066_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_9066_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_9066_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_9066_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_dd6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_7640]
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_7640]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_7640]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_7640]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_7640]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_6785]
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2808_c7_74bc]
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_74bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2808_c7_74bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_74bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2812_c11_9c41]
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2812_c7_eab4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2812_c7_eab4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output);

-- n8_MUX_uxn_opcodes_h_l2782_c2_2037
n8_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- t8_MUX_uxn_opcodes_h_l2782_c2_2037
t8_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output);

-- n8_MUX_uxn_opcodes_h_l2787_c7_c6cc
n8_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- t8_MUX_uxn_opcodes_h_l2787_c7_c6cc
t8_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output);

-- n8_MUX_uxn_opcodes_h_l2790_c7_6f21
n8_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- t8_MUX_uxn_opcodes_h_l2790_c7_6f21
t8_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output);

-- n8_MUX_uxn_opcodes_h_l2794_c7_0ea9
n8_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output);

-- n8_MUX_uxn_opcodes_h_l2797_c7_dd48
n8_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff
BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left,
BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right,
BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19
BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left,
BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right,
BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output);

-- MUX_uxn_opcodes_h_l2800_c32_9066
MUX_uxn_opcodes_h_l2800_c32_9066 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2800_c32_9066_cond,
MUX_uxn_opcodes_h_l2800_c32_9066_iftrue,
MUX_uxn_opcodes_h_l2800_c32_9066_iffalse,
MUX_uxn_opcodes_h_l2800_c32_9066_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left,
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right,
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output,
 n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output,
 n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output,
 n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output,
 n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output,
 n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output,
 MUX_uxn_opcodes_h_l2800_c32_9066_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_03a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_19f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_a528 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_7ada : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_9066_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_9066_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_7978 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_a939 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_0cbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2817_l2778_DUPLICATE_8665_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_a528 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_a528;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_7ada := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_7ada;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_19f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_19f7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_03a5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_03a5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_a939 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_a939;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_7978 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_7978;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2800_c32_25ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_left;
     BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output := BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_266c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2782_c6_2bd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_dd6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_fc2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2812_c11_9c41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_6785] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_left;
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output := BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_6480] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_left;
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output := BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_2e24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_0cbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_0cbd_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_25ff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_2bd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_6480_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_fc2f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_266c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2e24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_dd6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_6785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_9c41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_DUPLICATE_c35d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_l2797_l2794_l2790_l2787_l2812_l2808_DUPLICATE_69ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2802_l2794_l2790_l2787_l2782_DUPLICATE_417e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2812_l2782_l2808_DUPLICATE_c503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_0cbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_0cbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2797_l2794_l2790_l2787_l2782_l2808_DUPLICATE_9564_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2808_c7_74bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_7640] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;

     -- t8_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2800_c32_ad19] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_left;
     BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output := BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2812_c7_eab4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2808_c7_74bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2812_c7_eab4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2800_c32_9066_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_ad19_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_eab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     -- t8_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- MUX[uxn_opcodes_h_l2800_c32_9066] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2800_c32_9066_cond <= VAR_MUX_uxn_opcodes_h_l2800_c32_9066_cond;
     MUX_uxn_opcodes_h_l2800_c32_9066_iftrue <= VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iftrue;
     MUX_uxn_opcodes_h_l2800_c32_9066_iffalse <= VAR_MUX_uxn_opcodes_h_l2800_c32_9066_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2800_c32_9066_return_output := MUX_uxn_opcodes_h_l2800_c32_9066_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_74bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_7640] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_7640] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output := result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;

     -- n8_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_74bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue := VAR_MUX_uxn_opcodes_h_l2800_c32_9066_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_74bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_7640] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_7640] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;

     -- t8_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- n8_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7640_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- n8_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_dd48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_dd48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_0ea9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_0ea9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_6f21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2787_c7_c6cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_c6cc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2782_c2_2037] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2817_l2778_DUPLICATE_8665 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2817_l2778_DUPLICATE_8665_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_2037_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_2037_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2817_l2778_DUPLICATE_8665_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2817_l2778_DUPLICATE_8665_return_output;
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
