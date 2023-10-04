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
entity sub_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_fd2391e7;
architecture arch of sub_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2206_c6_778c]
signal BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2206_c1_3d9b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2206_c2_3557]
signal t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2206_c2_3557]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2206_c2_3557]
signal n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2207_c3_8ec6[uxn_opcodes_h_l2207_c3_8ec6]
signal printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_823b]
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2212_c7_1f24]
signal n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2215_c11_2c9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2215_c7_7cc4]
signal n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2219_c11_189f]
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2219_c7_709a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2219_c7_709a]
signal n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_8d2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2222_c7_8a08]
signal n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2226_c32_1f3e]
signal BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2226_c32_a865]
signal BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2226_c32_5b86]
signal MUX_uxn_opcodes_h_l2226_c32_5b86_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2226_c32_5b86_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2228_c11_1498]
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2228_c7_45df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2228_c7_45df]
signal result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2228_c7_45df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2228_c7_45df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2228_c7_45df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2232_c24_a882]
signal BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_9500]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_28fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_28fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c
BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left,
BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right,
BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output);

-- t8_MUX_uxn_opcodes_h_l2206_c2_3557
t8_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557
result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557
result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557
result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557
result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557
result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557
result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- n8_MUX_uxn_opcodes_h_l2206_c2_3557
n8_MUX_uxn_opcodes_h_l2206_c2_3557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond,
n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue,
n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse,
n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

-- printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6
printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6 : entity work.printf_uxn_opcodes_h_l2207_c3_8ec6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output);

-- t8_MUX_uxn_opcodes_h_l2212_c7_1f24
t8_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- n8_MUX_uxn_opcodes_h_l2212_c7_1f24
n8_MUX_uxn_opcodes_h_l2212_c7_1f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond,
n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue,
n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse,
n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output);

-- t8_MUX_uxn_opcodes_h_l2215_c7_7cc4
t8_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- n8_MUX_uxn_opcodes_h_l2215_c7_7cc4
n8_MUX_uxn_opcodes_h_l2215_c7_7cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond,
n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue,
n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse,
n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left,
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right,
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a
result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a
result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a
result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- n8_MUX_uxn_opcodes_h_l2219_c7_709a
n8_MUX_uxn_opcodes_h_l2219_c7_709a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond,
n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue,
n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse,
n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08
result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08
result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08
result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- n8_MUX_uxn_opcodes_h_l2222_c7_8a08
n8_MUX_uxn_opcodes_h_l2222_c7_8a08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond,
n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue,
n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse,
n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e
BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left,
BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right,
BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865
BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left,
BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right,
BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output);

-- MUX_uxn_opcodes_h_l2226_c32_5b86
MUX_uxn_opcodes_h_l2226_c32_5b86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2226_c32_5b86_cond,
MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue,
MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse,
MUX_uxn_opcodes_h_l2226_c32_5b86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left,
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right,
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df
result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond,
result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882
BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left,
BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right,
BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output,
 t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output,
 t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output,
 t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output,
 MUX_uxn_opcodes_h_l2226_c32_5b86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_37dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_d2aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_013c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_0b14 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2231_c3_82a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2228_l2222_DUPLICATE_8a0a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2239_l2202_DUPLICATE_5fdc_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2231_c3_82a5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2231_c3_82a5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_37dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_37dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_013c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_013c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_0b14 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_0b14;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_d2aa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_d2aa;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2228_l2222_DUPLICATE_8a0a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2228_l2222_DUPLICATE_8a0a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2219_c11_189f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_9500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2206_c6_778c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2228_c11_1498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_left;
     BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output := BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_823b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2215_c11_2c9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2226_c32_1f3e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_left;
     BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output := BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output := result.stack_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2232_c24_a882] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_8d2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2226_c32_1f3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2206_c6_778c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_823b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_2c9e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_189f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_8d2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_1498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9500_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2232_c24_a882_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2222_DUPLICATE_7a0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2234_l2228_l2222_DUPLICATE_8d97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_DUPLICATE_73e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2219_l2212_l2222_DUPLICATE_f192_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2234_l2222_DUPLICATE_9285_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2228_l2222_DUPLICATE_8a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2228_l2222_DUPLICATE_8a0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2219_l2215_l2212_l2206_l2228_l2222_DUPLICATE_bf92_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2206_c1_3d9b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2228_c7_45df] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output := result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2228_c7_45df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;

     -- n8_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_28fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_28fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2228_c7_45df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2226_c32_a865] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_left;
     BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output := BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2226_c32_a865_return_output;
     VAR_printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2206_c1_3d9b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_28fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     -- t8_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- MUX[uxn_opcodes_h_l2226_c32_5b86] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2226_c32_5b86_cond <= VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_cond;
     MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue <= VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iftrue;
     MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse <= VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_return_output := MUX_uxn_opcodes_h_l2226_c32_5b86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2228_c7_45df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;

     -- printf_uxn_opcodes_h_l2207_c3_8ec6[uxn_opcodes_h_l2207_c3_8ec6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2207_c3_8ec6_uxn_opcodes_h_l2207_c3_8ec6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2228_c7_45df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;

     -- n8_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue := VAR_MUX_uxn_opcodes_h_l2226_c32_5b86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_45df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     -- n8_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_8a08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;

     -- t8_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_8a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2219_c7_709a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_709a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     -- n8_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c7_7cc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_7cc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_1f24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_1f24_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2206_c2_3557] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2239_l2202_DUPLICATE_5fdc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2239_l2202_DUPLICATE_5fdc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2206_c2_3557_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2206_c2_3557_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2239_l2202_DUPLICATE_5fdc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2239_l2202_DUPLICATE_5fdc_return_output;
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
