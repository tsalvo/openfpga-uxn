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
-- Submodules: 65
entity sth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_302e9520;
architecture arch of sth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_8db3]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_04de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2293_c2_011e]
signal t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_011e]
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2294_c3_0c7a[uxn_opcodes_h_l2294_c3_0c7a]
signal printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_0063]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_c04c]
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_0954]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_aec8]
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2303_c3_39a8]
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_7f1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_d62d]
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2306_c3_142a]
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2308_c30_ba01]
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_52ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_5736]
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_1581]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_0a87]
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2320_c31_a50a]
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_3650]
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_13a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_13a0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_13a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e71( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output);

-- t16_MUX_uxn_opcodes_h_l2293_c2_011e
t16_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

-- printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a
printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a : entity work.printf_uxn_opcodes_h_l2294_c3_0c7a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output);

-- t16_MUX_uxn_opcodes_h_l2298_c7_c04c
t16_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output);

-- t16_MUX_uxn_opcodes_h_l2301_c7_aec8
t16_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8
CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x,
CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output);

-- t16_MUX_uxn_opcodes_h_l2305_c7_d62d
t16_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a
BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01
sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins,
sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x,
sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y,
sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a
CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x,
CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output,
 t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output,
 t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output,
 t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output,
 CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output,
 t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output,
 CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_ac4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_558c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_1c86 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_dfce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_d5bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_8034 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_9252_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_6c09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e71_uxn_opcodes_h_l2328_l2289_DUPLICATE_b689_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_1c86 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_1c86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_dfce := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_dfce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_ac4b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_ac4b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_558c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_558c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_8034 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_8034;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2308_c30_ba01] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_ins;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_x;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output := sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_0954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_3650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_left;
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output := BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c21_d5bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_d5bc_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_8db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_6c09 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_6c09_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_1581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2320_c31_a50a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output := CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_52ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_7f1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_0063] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_8db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_0063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_0954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_7f1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_52ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_1581_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_3650_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_6c09_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_6c09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_d5bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_92fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_e7b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_9e83_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_f535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3f70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_1e63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_6e3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_ba01_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2303_c3_39a8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output := CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_13a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2320_c21_9252] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_9252_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_a50a_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_13a0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2306_c3_142a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_left;
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output := BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_13a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_04de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_142a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_9252_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_39a8_return_output;
     VAR_printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_04de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_13a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- printf_uxn_opcodes_h_l2294_c3_0c7a[uxn_opcodes_h_l2294_c3_0c7a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2294_c3_0c7a_uxn_opcodes_h_l2294_c3_0c7a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_0a87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_0a87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_5736] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_5736_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_d62d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_d62d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_aec8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_aec8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_c04c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_c04c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_011e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e71_uxn_opcodes_h_l2328_l2289_DUPLICATE_b689 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e71_uxn_opcodes_h_l2328_l2289_DUPLICATE_b689_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e71(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_011e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_011e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e71_uxn_opcodes_h_l2328_l2289_DUPLICATE_b689_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e71_uxn_opcodes_h_l2328_l2289_DUPLICATE_b689_return_output;
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
