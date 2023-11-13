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
-- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_b24c]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_11a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2293_c2_e4fa]
signal t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2294_c3_427f[uxn_opcodes_h_l2294_c3_427f]
signal printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_d98e]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_1177]
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2298_c7_1177]
signal t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_702a]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2301_c7_a5a5]
signal t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2303_c3_9b3b]
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_db95]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_955b]
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2305_c7_955b]
signal t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2306_c3_1185]
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2308_c30_5bd7]
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_100b]
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_f1f1]
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_4b26]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_e885]
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2320_c31_1e61]
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_e691]
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_088b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_088b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_088b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cecc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- t16_MUX_uxn_opcodes_h_l2293_c2_e4fa
t16_MUX_uxn_opcodes_h_l2293_c2_e4fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond,
t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue,
t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse,
t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

-- printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f
printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f : entity work.printf_uxn_opcodes_h_l2294_c3_427f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- t16_MUX_uxn_opcodes_h_l2298_c7_1177
t16_MUX_uxn_opcodes_h_l2298_c7_1177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond,
t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue,
t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse,
t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- t16_MUX_uxn_opcodes_h_l2301_c7_a5a5
t16_MUX_uxn_opcodes_h_l2301_c7_a5a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond,
t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue,
t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse,
t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b
CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x,
CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- t16_MUX_uxn_opcodes_h_l2305_c7_955b
t16_MUX_uxn_opcodes_h_l2305_c7_955b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond,
t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue,
t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse,
t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7
sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins,
sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x,
sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y,
sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61
CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x,
CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output,
 CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output,
 sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output,
 CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_54db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_b0ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_9824 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_470d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_e127_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_2b4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_804a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2302_l2306_DUPLICATE_8207_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cecc_uxn_opcodes_h_l2328_l2289_DUPLICATE_e991_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_470d := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_470d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_9824 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_9824;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_54db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_54db;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_2b4e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_2b4e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_b0ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_b0ad;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2308_c30_5bd7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_ins;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_x;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output := sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_d98e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_100b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2302_l2306_DUPLICATE_8207 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2302_l2306_DUPLICATE_8207_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_702a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2320_c31_1e61] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output := CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_e691] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_left;
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output := BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c21_e127] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_e127_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_db95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_b24c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_4b26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_b24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_d98e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_702a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_db95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_100b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4b26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_e691_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2302_l2306_DUPLICATE_8207_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2302_l2306_DUPLICATE_8207_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_e127_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2310_l2301_l2293_DUPLICATE_0db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2322_l2317_l2310_l2305_l2301_DUPLICATE_ce2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2310_l2301_DUPLICATE_cb2e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_3fc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2293_l2322_l2317_l2305_l2301_DUPLICATE_b0a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2317_l2305_DUPLICATE_4447_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2298_l2293_l2317_l2305_l2301_DUPLICATE_4aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_5bd7_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2303_c3_9b3b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output := CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2306_c3_1185] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_left;
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output := BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2320_c21_804a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_804a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_1e61_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_11a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_088b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_088b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_088b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1185_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_804a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_9b3b_return_output;
     VAR_printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_11a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_088b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     -- t16_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- printf_uxn_opcodes_h_l2294_c3_427f[uxn_opcodes_h_l2294_c3_427f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2294_c3_427f_uxn_opcodes_h_l2294_c3_427f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_e885] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_e885_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_f1f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_f1f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_955b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_955b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_a5a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_a5a5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_1177] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_1177_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_e4fa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cecc_uxn_opcodes_h_l2328_l2289_DUPLICATE_e991 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cecc_uxn_opcodes_h_l2328_l2289_DUPLICATE_e991_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cecc(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_e4fa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cecc_uxn_opcodes_h_l2328_l2289_DUPLICATE_e991_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cecc_uxn_opcodes_h_l2328_l2289_DUPLICATE_e991_return_output;
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
