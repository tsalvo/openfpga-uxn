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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2154_c6_1d7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2154_c1_f960]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2154_c2_b080]
signal t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2154_c2_b080]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2155_c3_76ec[uxn_opcodes_h_l2155_c3_76ec]
signal printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_32a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2160_c7_0a60]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_17e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2163_c7_4545]
signal t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2163_c7_4545]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2165_c3_68db]
signal CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_f50c]
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2168_c7_8dd7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_50cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2171_c7_808d]
signal t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2171_c7_808d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2172_c3_e289]
signal BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2175_c11_76ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2175_c7_6493]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2177_c32_1d4f]
signal BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2177_c32_5bea]
signal BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2177_c32_0c5b]
signal MUX_uxn_opcodes_h_l2177_c32_0c5b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2179_c11_e6dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2179_c7_dca8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2183_c11_764d]
signal BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2183_c7_f02b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_850b]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2189_c7_318f]
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_318f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2189_c7_318f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_318f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2189_c7_318f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2191_c34_2270]
signal CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_2264]
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2193_c7_8d30]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_8d30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_8d30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2538( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e
BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output);

-- t16_MUX_uxn_opcodes_h_l2154_c2_b080
t16_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080
result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

-- printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec
printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec : entity work.printf_uxn_opcodes_h_l2155_c3_76ec_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output);

-- t16_MUX_uxn_opcodes_h_l2160_c7_0a60
t16_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output);

-- t16_MUX_uxn_opcodes_h_l2163_c7_4545
t16_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545
result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545
result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545
result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545
result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2165_c3_68db
CONST_SL_8_uxn_opcodes_h_l2165_c3_68db : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x,
CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output);

-- t16_MUX_uxn_opcodes_h_l2168_c7_8dd7
t16_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output);

-- t16_MUX_uxn_opcodes_h_l2171_c7_808d
t16_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d
result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d
result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289
BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left,
BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right,
BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493
result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493
result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f
BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left,
BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right,
BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea
BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left,
BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right,
BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output);

-- MUX_uxn_opcodes_h_l2177_c32_0c5b
MUX_uxn_opcodes_h_l2177_c32_0c5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2177_c32_0c5b_cond,
MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue,
MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse,
MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8
result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8
result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d
BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left,
BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right,
BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b
result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b
result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b
result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b
result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2191_c34_2270
CONST_SR_8_uxn_opcodes_h_l2191_c34_2270 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x,
CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output,
 t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output,
 t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output,
 t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output,
 CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output,
 t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output,
 t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output,
 MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_b132 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2161_c3_26e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2166_c3_f0b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2169_c3_0da0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2181_c3_122a : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_f052 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2187_c24_58fc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2190_c3_6cf3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2191_c24_dd97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2164_l2172_DUPLICATE_4f91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2538_uxn_opcodes_h_l2199_l2150_DUPLICATE_9284_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_f052 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_f052;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right := to_unsigned(128, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2181_c3_122a := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2181_c3_122a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2169_c3_0da0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2169_c3_0da0;
     VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2161_c3_26e6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2161_c3_26e6;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2190_c3_6cf3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2190_c3_6cf3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_b132 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_b132;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2166_c3_f0b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2166_c3_f0b0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2164_l2172_DUPLICATE_4f91 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2164_l2172_DUPLICATE_4f91_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_f50c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2187_c24_58fc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2187_c24_58fc_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_850b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_32a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2177_c32_1d4f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_left;
     BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output := BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2179_c11_e6dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_17e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2191_c34_2270] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output := CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2175_c11_76ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_2264] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_left;
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output := BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2183_c11_764d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_50cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2154_c6_1d7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2177_c32_1d4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c6_1d7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_32a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_17e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_f50c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_50cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_76ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_e6dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2183_c11_764d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_2264_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2164_l2172_DUPLICATE_4f91_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2164_l2172_DUPLICATE_4f91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2187_c24_58fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2154_DUPLICATE_8238_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_DUPLICATE_7f21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2179_l2171_l2168_l2163_l2160_l2183_l2154_DUPLICATE_0900_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2183_l2154_DUPLICATE_dadd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2168_l2160_l2171_l2163_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2193_l2163_l2189_l2160_l2154_DUPLICATE_4f1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2179_l2171_l2175_l2189_DUPLICATE_7035_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2179_l2175_l2171_l2168_l2163_l2189_l2160_l2154_DUPLICATE_b78a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_8d30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2191_c24_dd97] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2191_c24_dd97_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2191_c34_2270_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2154_c1_f960] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2172_c3_e289] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_left;
     BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output := BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_318f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2177_c32_5bea] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_left;
     BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output := BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_8d30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2193_c7_8d30] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2165_c3_68db] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output := CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2177_c32_5bea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2172_c3_e289_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2191_c24_dd97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2165_c3_68db_return_output;
     VAR_printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2154_c1_f960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_8d30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_318f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2189_c7_318f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2189_c7_318f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2189_c7_318f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;

     -- MUX[uxn_opcodes_h_l2177_c32_0c5b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2177_c32_0c5b_cond <= VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_cond;
     MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue <= VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iftrue;
     MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse <= VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output := MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- printf_uxn_opcodes_h_l2155_c3_76ec[uxn_opcodes_h_l2155_c3_76ec] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2155_c3_76ec_uxn_opcodes_h_l2155_c3_76ec_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue := VAR_MUX_uxn_opcodes_h_l2177_c32_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_318f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- t16_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2183_c7_f02b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2183_c7_f02b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2179_c7_dca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2179_c7_dca8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2175_c7_6493] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output := result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2175_c7_6493_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     -- t16_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_808d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2171_c7_808d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_8dd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2168_c7_8dd7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_4545] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2163_c7_4545_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_0a60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_0a60_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2154_c2_b080] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output := result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2538_uxn_opcodes_h_l2199_l2150_DUPLICATE_9284 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2538_uxn_opcodes_h_l2199_l2150_DUPLICATE_9284_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2538(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c2_b080_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2154_c2_b080_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2538_uxn_opcodes_h_l2199_l2150_DUPLICATE_9284_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2538_uxn_opcodes_h_l2199_l2150_DUPLICATE_9284_return_output;
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
