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
-- BIN_OP_EQ[uxn_opcodes_h_l2991_c6_85ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2991_c1_8830]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c2_2e37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l2992_c3_824d[uxn_opcodes_h_l2992_c3_824d]
signal printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2996_c11_049c]
signal BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2996_c7_1e7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_8ef0]
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_c6bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3001_c3_3143]
signal CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3004_c11_e92a]
signal BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3004_c7_59ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3007_c11_1b83]
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3007_c7_e9c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3008_c3_617c]
signal BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l3010_c30_c1b9]
signal sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_e538]
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_b439]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3015_c7_b439]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_b439]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_b439]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_b439]
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3020_c11_579b]
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3020_c7_e216]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3020_c7_e216]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3020_c7_e216]
signal result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3020_c7_e216]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3024_c11_4308]
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3024_c7_b770]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3024_c7_b770]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3024_c7_b770]
signal result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3024_c7_b770]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3028_c11_ea04]
signal BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3028_c7_cca7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3028_c7_cca7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca
BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output);

-- t16_MUX_uxn_opcodes_h_l2991_c2_2e37
t16_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37
result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

-- printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d
printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d : entity work.printf_uxn_opcodes_h_l2992_c3_824d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c
BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left,
BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right,
BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output);

-- t16_MUX_uxn_opcodes_h_l2996_c7_1e7b
t16_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output);

-- t16_MUX_uxn_opcodes_h_l2999_c7_c6bc
t16_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3001_c3_3143
CONST_SL_8_uxn_opcodes_h_l3001_c3_3143 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x,
CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a
BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left,
BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right,
BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output);

-- t16_MUX_uxn_opcodes_h_l3004_c7_59ba
t16_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba
result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba
result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba
result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba
result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83
BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left,
BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right,
BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output);

-- t16_MUX_uxn_opcodes_h_l3007_c7_e9c3
t16_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c
BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left,
BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right,
BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9
sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins,
sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x,
sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y,
sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439
result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left,
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right,
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216
result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond,
result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left,
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right,
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770
result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond,
result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04
BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left,
BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right,
BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7
result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7
result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f
CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output,
 t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output,
 t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output,
 t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output,
 CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output,
 t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output,
 t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output,
 sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2993_c3_b03a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_4556 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_46f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3005_c3_a04d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_27a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c21_2e22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_3839 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_d073 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3022_c21_154f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_7bf2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3024_c7_b770_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3000_l3008_DUPLICATE_e7df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_ede6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2987_l3033_DUPLICATE_5953_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3005_c3_a04d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3005_c3_a04d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_27a5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_27a5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_4556 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_4556;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_3839 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_3839;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_7bf2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_7bf2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_d073 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_d073;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2993_c3_b03a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2993_c3_b03a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_46f9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_46f9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3007_c11_1b83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_left;
     BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output := BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_8ef0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3022_c21_154f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3022_c21_154f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3024_c11_4308] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_left;
     BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output := BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_e538] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_left;
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output := BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3020_c11_579b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3000_l3008_DUPLICATE_e7df LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3000_l3008_DUPLICATE_e7df_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l3010_c30_c1b9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_ins;
     sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_x;
     sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output := sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3024_c7_b770] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3024_c7_b770_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3004_c11_e92a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c6_85ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3028_c11_ea04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_left;
     BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output := BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2996_c11_049c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c6_85ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2996_c11_049c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_8ef0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3004_c11_e92a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c11_1b83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_579b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_4308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3028_c11_ea04_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3000_l3008_DUPLICATE_e7df_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3000_l3008_DUPLICATE_e7df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3022_c21_154f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3007_l3004_l2999_l2996_l2991_DUPLICATE_886c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3007_l3004_l2999_l3028_l2996_l3024_l3020_DUPLICATE_def0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3015_l3004_l2999_l2996_l2991_DUPLICATE_5fdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3015_l3004_l2999_l3028_l2996_l3024_l2991_l3020_DUPLICATE_75d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3004_l2999_l2996_l3024_l2991_DUPLICATE_205c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3024_c7_b770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l3010_c30_c1b9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3015_c7_b439] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_ede6 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_ede6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_c55f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3024_c7_b770] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3008_c3_617c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_left;
     BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output := BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3001_c3_3143] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output := CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2991_c1_8830] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3028_c7_cca7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3028_c7_cca7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_ede6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3018_l3026_DUPLICATE_ede6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3001_c3_3143_return_output;
     VAR_printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2991_c1_8830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3028_c7_cca7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3020_c7_e216] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3024_c7_b770] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output := result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;

     -- printf_uxn_opcodes_h_l2992_c3_824d[uxn_opcodes_h_l2992_c3_824d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2992_c3_824d_uxn_opcodes_h_l2992_c3_824d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3024_c7_b770] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3013_c21_2e22] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c21_2e22_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l3008_c3_617c_return_output);

     -- t16_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3024_c7_b770] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c21_2e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3024_c7_b770_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3020_c7_e216] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3020_c7_e216] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_b439] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3020_c7_e216] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output := result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3020_c7_e216_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_b439] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_b439] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_b439] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output := result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_b439_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3007_c7_e9c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3007_c7_e9c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3004_c7_59ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3004_c7_59ba_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_c6bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_c6bc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2996_c7_1e7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2996_c7_1e7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c2_2e37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2987_l3033_DUPLICATE_5953 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2987_l3033_DUPLICATE_5953_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c2_2e37_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2987_l3033_DUPLICATE_5953_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2987_l3033_DUPLICATE_5953_return_output;
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
