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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2938_c6_f87c]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_ac80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2938_c2_2274]
signal n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2938_c2_2274]
signal result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2938_c2_2274]
signal t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2939_c3_36c5[uxn_opcodes_h_l2939_c3_36c5]
signal printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_1b73]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2944_c7_09cf]
signal t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_b6ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2947_c7_f240]
signal n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2947_c7_f240]
signal result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2947_c7_f240]
signal t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_fa69]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2952_c7_8e92]
signal t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_a892]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2955_c7_a994]
signal n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2955_c7_a994]
signal result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2955_c7_a994]
signal t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2956_c3_9aec]
signal BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_46b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2959_c7_8bf6]
signal result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_51f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2962_c7_5504]
signal n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2962_c7_5504]
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_ba07]
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_2b95]
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2970_c11_cd0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2970_c7_36cc]
signal result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2971_c3_3327]
signal BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2974_c32_a70e]
signal BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2974_c32_7135]
signal BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2974_c32_a3d2]
signal MUX_uxn_opcodes_h_l2974_c32_a3d2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2976_c11_8c81]
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2976_c7_a680]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2976_c7_a680]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2976_c7_a680]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2976_c7_a680]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2976_c7_a680]
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_f0d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_39d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_39d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_39d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_39d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_39d2]
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2984_c34_3394]
signal CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_2863]
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_869f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_869f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_869f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_869f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_869f]
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_2121]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_8eda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_8eda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_8eda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_8eda]
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2993_c34_f340]
signal CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_30c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_33f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_33f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c
BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output);

-- n16_MUX_uxn_opcodes_h_l2938_c2_2274
n16_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274
result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274
result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274
result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274
result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- t16_MUX_uxn_opcodes_h_l2938_c2_2274
t16_MUX_uxn_opcodes_h_l2938_c2_2274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond,
t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue,
t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse,
t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

-- printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5
printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5 : entity work.printf_uxn_opcodes_h_l2939_c3_36c5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output);

-- n16_MUX_uxn_opcodes_h_l2944_c7_09cf
n16_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf
result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- t16_MUX_uxn_opcodes_h_l2944_c7_09cf
t16_MUX_uxn_opcodes_h_l2944_c7_09cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond,
t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue,
t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse,
t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output);

-- n16_MUX_uxn_opcodes_h_l2947_c7_f240
n16_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240
result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240
result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240
result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240
result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240
result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240
result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- t16_MUX_uxn_opcodes_h_l2947_c7_f240
t16_MUX_uxn_opcodes_h_l2947_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond,
t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue,
t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse,
t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output);

-- n16_MUX_uxn_opcodes_h_l2952_c7_8e92
n16_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92
result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- t16_MUX_uxn_opcodes_h_l2952_c7_8e92
t16_MUX_uxn_opcodes_h_l2952_c7_8e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond,
t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue,
t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse,
t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output);

-- n16_MUX_uxn_opcodes_h_l2955_c7_a994
n16_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994
result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994
result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994
result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994
result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994
result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994
result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- t16_MUX_uxn_opcodes_h_l2955_c7_a994
t16_MUX_uxn_opcodes_h_l2955_c7_a994 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond,
t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue,
t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse,
t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec
BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left,
BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right,
BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output);

-- n16_MUX_uxn_opcodes_h_l2959_c7_8bf6
n16_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6
result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2962_c7_5504
n16_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504
result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond,
result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output);

-- n16_MUX_uxn_opcodes_h_l2967_c7_2b95
n16_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95
result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d
BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output);

-- n16_MUX_uxn_opcodes_h_l2970_c7_36cc
n16_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc
result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc
result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc
result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc
result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc
result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327
BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left,
BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right,
BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e
BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left,
BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right,
BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135
BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left,
BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right,
BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output);

-- MUX_uxn_opcodes_h_l2974_c32_a3d2
MUX_uxn_opcodes_h_l2974_c32_a3d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2974_c32_a3d2_cond,
MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue,
MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse,
MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left,
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right,
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2984_c34_3394
CONST_SR_8_uxn_opcodes_h_l2984_c34_3394 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x,
CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2993_c34_f340
CONST_SR_8_uxn_opcodes_h_l2993_c34_f340 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x,
CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc
CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output,
 n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output,
 n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output,
 n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output,
 n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output,
 n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output,
 n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output,
 n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output,
 n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output,
 n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output,
 MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output,
 CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_9888 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2945_c3_e631 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_ea86 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2953_c3_4dd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2957_c3_57bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2960_c3_8378 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_a67d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2968_c3_aaf6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2979_c3_64a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2980_c24_4032_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2983_c3_e3a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2984_c24_a30e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_fd99 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2989_c24_62b4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_9f48 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2993_c24_fd16_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2991_l2970_DUPLICATE_a4f1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2934_l3000_DUPLICATE_abd1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2968_c3_aaf6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2968_c3_aaf6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_a67d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_a67d;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2957_c3_57bf := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2957_c3_57bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_ea86 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_ea86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2960_c3_8378 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2960_c3_8378;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_9f48 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_9f48;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2953_c3_4dd4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2953_c3_4dd4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2983_c3_e3a6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2983_c3_e3a6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_fd99 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_fd99;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2979_c3_64a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2979_c3_64a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_9888 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_9888;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2945_c3_e631 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2945_c3_e631;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l2984_c34_3394] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output := CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2976_c11_8c81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_2863] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_left;
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output := BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_b6ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2980_c24_4032] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2980_c24_4032_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_30c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_f0d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_ba07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2991_l2970_DUPLICATE_a4f1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2991_l2970_DUPLICATE_a4f1_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2993_c34_f340] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output := CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2974_c32_a70e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_left;
     BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output := BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_a892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_46b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2989_c24_62b4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2989_c24_62b4_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c6_f87c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_fa69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_1b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2970_c11_cd0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_51f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_2121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2974_c32_a70e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c6_f87c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_1b73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b6ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_fa69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_a892_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_46b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_51f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_ba07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2970_c11_cd0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_8c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_f0d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_2863_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_2121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_30c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2971_l2948_l2956_l2963_DUPLICATE_6949_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2980_c24_4032_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2989_c24_62b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_4933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2976_l2947_l2970_l2944_l2967_l2995_DUPLICATE_44f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2962_l2959_l2986_l2955_l2982_l2952_l2947_l2944_l2967_l2938_DUPLICATE_6376_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2962_l2959_l2955_l2952_l2947_l2970_l2944_l2967_DUPLICATE_64dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2986_l2955_l2982_l2952_l2947_l2970_l2944_l2967_l2995_l2938_DUPLICATE_7f89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2991_l2970_DUPLICATE_a4f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2991_l2970_DUPLICATE_a4f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2962_l2991_l2959_l2955_l2952_l2947_l2970_l2944_l2967_l2938_DUPLICATE_78be_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_33f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2974_c32_7135] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_left;
     BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output := BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_869f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2993_c24_fd16] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2993_c24_fd16_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2993_c34_f340_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2971_c3_3327] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_left;
     BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output := BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2984_c24_a30e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2984_c24_a30e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2984_c34_3394_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_ac80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2956_c3_9aec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_left;
     BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output := BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_8eda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_33f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2974_c32_7135_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2956_c3_9aec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2971_c3_3327_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2984_c24_a30e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2993_c24_fd16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2949_l2964_DUPLICATE_2ffc_return_output;
     VAR_printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_ac80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_33f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;
     -- t16_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_8eda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;

     -- n16_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- MUX[uxn_opcodes_h_l2974_c32_a3d2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2974_c32_a3d2_cond <= VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_cond;
     MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue <= VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iftrue;
     MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse <= VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output := MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output;

     -- printf_uxn_opcodes_h_l2939_c3_36c5[uxn_opcodes_h_l2939_c3_36c5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2939_c3_36c5_uxn_opcodes_h_l2939_c3_36c5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_39d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_8eda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_869f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_8eda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output := result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue := VAR_MUX_uxn_opcodes_h_l2974_c32_a3d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_8eda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     -- n16_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_39d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2976_c7_a680] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_869f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_869f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_869f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_869f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2976_c7_a680] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;

     -- t16_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_39d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_39d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_39d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_39d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2976_c7_a680] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output := result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- t16_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2976_c7_a680] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2976_c7_a680] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;

     -- n16_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_a680_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- t16_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2970_c7_36cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2970_c7_36cc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- n16_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_2b95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_2b95_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- n16_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2962_c7_5504] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output := result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c7_5504_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2959_c7_8bf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2959_c7_8bf6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2955_c7_a994] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output := result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;

     -- n16_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2955_c7_a994_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_8e92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_8e92_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2947_c7_f240] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output := result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2947_c7_f240_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_09cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_09cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2938_c2_2274] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2934_l3000_DUPLICATE_abd1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2934_l3000_DUPLICATE_abd1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c2_2274_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2938_c2_2274_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2934_l3000_DUPLICATE_abd1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2934_l3000_DUPLICATE_abd1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
