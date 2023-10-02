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
-- Submodules: 84
entity dup2_0CLK_a05d6369 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_a05d6369;
architecture arch of dup2_0CLK_a05d6369 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1926_c6_62f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1926_c1_a860]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1926_c2_2ad1]
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1927_c3_145b[uxn_opcodes_h_l1927_c3_145b]
signal printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_0701]
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_1b7f]
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_9280]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_d211]
signal t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_d211]
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1940_c3_5b39]
signal CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_6577]
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1944_c7_c591]
signal t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1944_c7_c591]
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1948_c11_b397]
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1948_c7_26e7]
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1949_c3_0f10]
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1952_c32_1f53]
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1952_c32_a871]
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1952_c32_5dd5]
signal MUX_uxn_opcodes_h_l1952_c32_5dd5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_76f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_fd1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_fd1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_fd1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_fd1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1954_c7_fd1b]
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_7256]
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_3067]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1961_c7_3067]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_3067]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_3067]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1961_c7_3067]
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_9975]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_f6d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_f6d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_f6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_f6d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_f6d6]
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_0b62]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_bad2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_bad2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_bad2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_bad2]
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_18c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_6984]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_6984]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output);

-- t16_MUX_uxn_opcodes_h_l1926_c2_2ad1
t16_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

-- printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b
printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b : entity work.printf_uxn_opcodes_h_l1927_c3_145b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output);

-- t16_MUX_uxn_opcodes_h_l1934_c7_1b7f
t16_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_d211
t16_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39
CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x,
CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output);

-- t16_MUX_uxn_opcodes_h_l1944_c7_c591
t16_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left,
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right,
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output);

-- t16_MUX_uxn_opcodes_h_l1948_c7_26e7
t16_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10
BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left,
BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right,
BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53
BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left,
BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right,
BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871
BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left,
BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right,
BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output);

-- MUX_uxn_opcodes_h_l1952_c32_5dd5
MUX_uxn_opcodes_h_l1952_c32_5dd5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1952_c32_5dd5_cond,
MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue,
MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse,
MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output,
 t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output,
 t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output,
 CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output,
 t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output,
 t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output,
 MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_67bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_5306 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_21a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_eea8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_26e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_9ee2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_99b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_39b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_7f37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_1611_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_f73b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_46ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_89fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1982_l1922_DUPLICATE_4819_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_21a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_21a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_39b2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_39b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_eea8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_eea8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_7f37 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_7f37;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_5306 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_5306;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_9ee2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_9ee2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_99b0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_99b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_67bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_67bc;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right := to_unsigned(5, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := t16;
     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_26e7_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_9975] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_18c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_1611 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_1611_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_0b62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_f73b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_f73b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_76f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_6577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_left;
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output := BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_46ec LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_46ec_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_9280] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_0701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_left;
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output := BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1952_c32_1f53] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_left;
     BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output := BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_7256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_left;
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output := BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_2ad1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1926_c6_62f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1948_c11_b397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_left;
     BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output := BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_1f53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_62f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_0701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_9280_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_6577_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_b397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_76f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_7256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_9975_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_0b62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_18c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_1611_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_1611_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_46ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_46ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_6b4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_28eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_b792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_e0e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_f73b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_f73b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_63b1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_2ad1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_26e7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1940_c3_5b39] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output := CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_bad2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_6984] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1926_c1_a860] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_89fc LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_89fc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_b2e2_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1949_c3_0f10] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_left;
     BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output := BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1952_c32_a871] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_left;
     BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output := BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_6984] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_a871_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_0f10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_89fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_89fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_5b39_return_output;
     VAR_printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_a860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_6984_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_6984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_bad2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_3067] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;

     -- t16_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_bad2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_f6d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;

     -- printf_uxn_opcodes_h_l1927_c3_145b[uxn_opcodes_h_l1927_c3_145b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1927_c3_145b_uxn_opcodes_h_l1927_c3_145b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1952_c32_5dd5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1952_c32_5dd5_cond <= VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_cond;
     MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue <= VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iftrue;
     MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse <= VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output := MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_bad2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue := VAR_MUX_uxn_opcodes_h_l1952_c32_5dd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_bad2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_f6d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_fd1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_3067] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_f6d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1961_c7_3067] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output := result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_3067] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_fd1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1961_c7_3067] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_3067_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_fd1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_fd1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1954_c7_fd1b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_fd1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1948_c7_26e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_26e7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_c591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_c591_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_d211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_d211_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_1b7f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_1b7f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c2_2ad1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1982_l1922_DUPLICATE_4819 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1982_l1922_DUPLICATE_4819_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_2ad1_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1982_l1922_DUPLICATE_4819_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1982_l1922_DUPLICATE_4819_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
