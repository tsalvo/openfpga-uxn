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
-- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_3074]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_8d75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_c986]
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2293_c2_c986]
signal t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2294_c3_3867[uxn_opcodes_h_l2294_c3_3867]
signal printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_5fd1]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2298_c7_3f67]
signal t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_32a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_899d]
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2301_c7_899d]
signal t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2303_c3_fdf5]
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_b3a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2305_c7_77b8]
signal t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2306_c3_1a44]
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2308_c30_8c9c]
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_d0c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_0682]
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_5f1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_93cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2320_c31_9902]
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_efee]
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_ce7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_ce7f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_ce7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_12f7( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- t16_MUX_uxn_opcodes_h_l2293_c2_c986
t16_MUX_uxn_opcodes_h_l2293_c2_c986 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond,
t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue,
t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse,
t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

-- printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867
printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867 : entity work.printf_uxn_opcodes_h_l2294_c3_3867_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- t16_MUX_uxn_opcodes_h_l2298_c7_3f67
t16_MUX_uxn_opcodes_h_l2298_c7_3f67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond,
t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue,
t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse,
t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- t16_MUX_uxn_opcodes_h_l2301_c7_899d
t16_MUX_uxn_opcodes_h_l2301_c7_899d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond,
t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue,
t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse,
t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5
CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x,
CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- t16_MUX_uxn_opcodes_h_l2305_c7_77b8
t16_MUX_uxn_opcodes_h_l2305_c7_77b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond,
t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue,
t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse,
t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c
sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins,
sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x,
sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y,
sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2320_c31_9902
CONST_SR_8_uxn_opcodes_h_l2320_c31_9902 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x,
CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right,
BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output,
 sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output,
 CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_4c36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_2981 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_6808 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_bf14 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_24cb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_be62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_cf8d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_2d91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12f7_uxn_opcodes_h_l2328_l2289_DUPLICATE_cb64_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_bf14 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2312_c3_bf14;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_6808 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_6808;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_2981 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_2981;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_4c36 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_4c36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_be62 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2319_c3_be62;
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_5fd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2310_c11_d0c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c21_24cb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_24cb_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l2320_c31_9902] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output := CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_2d91 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_2d91_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2322_c11_efee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c6_3074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_5f1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2308_c30_8c9c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_ins;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_x;
     sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output := sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_32a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_b3a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c6_3074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_5fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_32a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_b3a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2310_c11_d0c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_5f1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2322_c11_efee_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_2d91_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2306_l2302_DUPLICATE_2d91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c21_24cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2298_l2310_l2301_DUPLICATE_fdea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2322_l2317_l2310_DUPLICATE_8e18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2301_l2298_l2293_l2317_l2310_DUPLICATE_8bc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_7fc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2322_l2317_DUPLICATE_2dbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_l2301_DUPLICATE_7d62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2305_l2301_l2298_l2293_l2317_DUPLICATE_d1b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2308_c30_8c9c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2322_c7_ce7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2306_c3_1a44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_left;
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output := BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2320_c21_cf8d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_cf8d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2320_c31_9902_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2322_c7_ce7f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2293_c1_8d75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2322_c7_ce7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2303_c3_fdf5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output := CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2320_c21_cf8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2303_c3_fdf5_return_output;
     VAR_printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2293_c1_8d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2322_c7_ce7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- printf_uxn_opcodes_h_l2294_c3_3867[uxn_opcodes_h_l2294_c3_3867] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2294_c3_3867_uxn_opcodes_h_l2294_c3_3867_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- t16_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2317_c7_93cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2317_c7_93cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- t16_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2310_c7_0682] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output := result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2310_c7_0682_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_77b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2305_c7_77b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_899d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_899d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_3f67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_3f67_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2293_c2_c986] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output := result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_12f7_uxn_opcodes_h_l2328_l2289_DUPLICATE_cb64 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12f7_uxn_opcodes_h_l2328_l2289_DUPLICATE_cb64_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_12f7(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c2_c986_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c2_c986_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12f7_uxn_opcodes_h_l2328_l2289_DUPLICATE_cb64_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_12f7_uxn_opcodes_h_l2328_l2289_DUPLICATE_cb64_return_output;
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
