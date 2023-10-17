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
-- Submodules: 70
entity dup2_0CLK_be266937 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_be266937;
architecture arch of dup2_0CLK_be266937 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2986_c6_7fdd]
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2986_c1_c201]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2986_c2_92e6]
signal t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2987_c3_63b6[uxn_opcodes_h_l2987_c3_63b6]
signal printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_9f2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2991_c7_1a1a]
signal t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_4a41]
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_401a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2994_c7_401a]
signal t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2996_c3_9413]
signal CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_9d0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2999_c7_af7b]
signal t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_7742]
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l3002_c7_1b36]
signal t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3003_c3_45fe]
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l3005_c30_515d]
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_9387]
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3010_c7_366a]
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_366a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_366a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_366a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_366a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_ce74]
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_bf38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_bf38]
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_bf38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_bf38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_44b7]
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_f8c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3019_c7_f8c0]
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_f8c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_f8c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_d6d9]
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_1d6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_1d6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left,
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right,
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2986_c2_92e6
t16_MUX_uxn_opcodes_h_l2986_c2_92e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond,
t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue,
t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse,
t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

-- printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6
printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6 : entity work.printf_uxn_opcodes_h_l2987_c3_63b6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- t16_MUX_uxn_opcodes_h_l2991_c7_1a1a
t16_MUX_uxn_opcodes_h_l2991_c7_1a1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond,
t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue,
t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse,
t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- t16_MUX_uxn_opcodes_h_l2994_c7_401a
t16_MUX_uxn_opcodes_h_l2994_c7_401a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond,
t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue,
t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse,
t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2996_c3_9413
CONST_SL_8_uxn_opcodes_h_l2996_c3_9413 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x,
CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- t16_MUX_uxn_opcodes_h_l2999_c7_af7b
t16_MUX_uxn_opcodes_h_l2999_c7_af7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond,
t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue,
t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse,
t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- t16_MUX_uxn_opcodes_h_l3002_c7_1b36
t16_MUX_uxn_opcodes_h_l3002_c7_1b36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond,
t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue,
t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse,
t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe
BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left,
BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right,
BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l3005_c30_515d
sp_relative_shift_uxn_opcodes_h_l3005_c30_515d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins,
sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x,
sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y,
sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output,
 CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output,
 sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_9ddd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_95b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_a458 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_cc36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_e077 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_ecc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_ce36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_a896 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_a564_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_5d78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_f8c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_1200_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3021_l3013_DUPLICATE_138f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l3028_l2982_DUPLICATE_dbe7_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_cc36 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_cc36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_a896 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_a896;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_e077 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_e077;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_a458 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_a458;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_95b3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_95b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_9ddd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_9ddd;
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_5d78 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_5d78;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_ce36 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_ce36;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_4a41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_d6d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l3005_c30_515d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_ins;
     sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_x;
     sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output := sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_ce74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_left;
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output := BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3017_c21_a564] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_a564_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_1200 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_1200_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_9387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_left;
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output := BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_44b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2986_c6_7fdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_9f2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_7742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_left;
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output := BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_9d0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3019_c7_f8c0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_f8c0_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_7fdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_9f2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_4a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_9d0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_9387_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_ce74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_44b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_d6d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_1200_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_1200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_a564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2991_l2986_l3002_l2999_l2994_DUPLICATE_fcae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3023_l2991_l3019_l3015_l3010_l3002_l2999_l2994_DUPLICATE_6509_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2991_l2986_l3010_l2999_l2994_DUPLICATE_65d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3023_l2991_l3019_l2986_l3015_l3010_l2999_l2994_DUPLICATE_c330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2991_l3019_l2986_l2999_l2994_DUPLICATE_b8c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_f8c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_515d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_f8c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_1d6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_1d6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3003_c3_45fe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_left;
     BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output := BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2996_c3_9413] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output := CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_366a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2986_c1_c201] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3021_l3013_DUPLICATE_138f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3021_l3013_DUPLICATE_138f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_bfca_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3021_l3013_DUPLICATE_138f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3021_l3013_DUPLICATE_138f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_9413_return_output;
     VAR_printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_c201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_1d6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;
     -- t16_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_f8c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3008_c21_ecc4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_ecc4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_45fe_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_bf38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3019_c7_f8c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- printf_uxn_opcodes_h_l2987_c3_63b6[uxn_opcodes_h_l2987_c3_63b6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2987_c3_63b6_uxn_opcodes_h_l2987_c3_63b6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_f8c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_ecc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_f8c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_bf38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output := result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_bf38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_bf38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_366a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_bf38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     -- t16_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_366a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3010_c7_366a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output := result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_366a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_366a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- t16_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_1b36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_1b36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_af7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_af7b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_401a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_401a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_1a1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_1a1a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c2_92e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l3028_l2982_DUPLICATE_dbe7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l3028_l2982_DUPLICATE_dbe7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_92e6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l3028_l2982_DUPLICATE_dbe7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l3028_l2982_DUPLICATE_dbe7_return_output;
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
