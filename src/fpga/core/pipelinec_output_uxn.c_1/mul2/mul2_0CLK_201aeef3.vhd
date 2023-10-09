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
-- Submodules: 123
entity mul2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_201aeef3;
architecture arch of mul2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2287_c6_9f81]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2287_c1_b389]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2287_c2_4723]
signal t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c2_4723]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c2_4723]
signal tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c2_4723]
signal n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2288_c3_804c[uxn_opcodes_h_l2288_c3_804c]
signal printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_c5e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2293_c7_0046]
signal t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_0046]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2293_c7_0046]
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2293_c7_0046]
signal n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2296_c11_2407]
signal BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2296_c7_afd1]
signal n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_99c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2301_c7_92d7]
signal n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2304_c11_beb3]
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2304_c7_fb5b]
signal n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2305_c3_782f]
signal BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_b574]
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2308_c7_fb58]
signal n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_2531]
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2311_c7_89c1]
signal n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_923a]
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2316_c7_ca25]
signal n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2319_c11_ee67]
signal BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2319_c7_4904]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2319_c7_4904]
signal tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2319_c7_4904]
signal n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2320_c3_11d2]
signal BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2321_c11_c649]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2324_c32_b90a]
signal BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2324_c32_3d84]
signal BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2324_c32_bc9f]
signal MUX_uxn_opcodes_h_l2324_c32_bc9f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2326_c11_3187]
signal BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2326_c7_931b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2326_c7_931b]
signal result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2326_c7_931b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2326_c7_931b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2326_c7_931b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2332_c11_6ac5]
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2332_c7_b342]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2332_c7_b342]
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2332_c7_b342]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2332_c7_b342]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2334_c34_1864]
signal CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2336_c11_0712]
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2336_c7_0e66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2336_c7_0e66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81
BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output);

-- t16_MUX_uxn_opcodes_h_l2287_c2_4723
t16_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723
result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c2_4723
tmp16_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c2_4723
n16_MUX_uxn_opcodes_h_l2287_c2_4723 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond,
n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

-- printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c
printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c : entity work.printf_uxn_opcodes_h_l2288_c3_804c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output);

-- t16_MUX_uxn_opcodes_h_l2293_c7_0046
t16_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046
result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2293_c7_0046
tmp16_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- n16_MUX_uxn_opcodes_h_l2293_c7_0046
n16_MUX_uxn_opcodes_h_l2293_c7_0046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond,
n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue,
n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse,
n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407
BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left,
BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right,
BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output);

-- t16_MUX_uxn_opcodes_h_l2296_c7_afd1
t16_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1
result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1
result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1
result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1
result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1
result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1
tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- n16_MUX_uxn_opcodes_h_l2296_c7_afd1
n16_MUX_uxn_opcodes_h_l2296_c7_afd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond,
n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue,
n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse,
n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output);

-- t16_MUX_uxn_opcodes_h_l2301_c7_92d7
t16_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7
tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2301_c7_92d7
n16_MUX_uxn_opcodes_h_l2301_c7_92d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond,
n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue,
n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse,
n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left,
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right,
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output);

-- t16_MUX_uxn_opcodes_h_l2304_c7_fb5b
t16_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b
tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- n16_MUX_uxn_opcodes_h_l2304_c7_fb5b
n16_MUX_uxn_opcodes_h_l2304_c7_fb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond,
n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue,
n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse,
n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f
BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left,
BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right,
BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58
tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- n16_MUX_uxn_opcodes_h_l2308_c7_fb58
n16_MUX_uxn_opcodes_h_l2308_c7_fb58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond,
n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue,
n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse,
n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1
result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1
tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2311_c7_89c1
n16_MUX_uxn_opcodes_h_l2311_c7_89c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond,
n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue,
n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse,
n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25
tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- n16_MUX_uxn_opcodes_h_l2316_c7_ca25
n16_MUX_uxn_opcodes_h_l2316_c7_ca25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond,
n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue,
n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse,
n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67
BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left,
BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right,
BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904
result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904
result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904
result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904
result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904
result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904
result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2319_c7_4904
tmp16_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- n16_MUX_uxn_opcodes_h_l2319_c7_4904
n16_MUX_uxn_opcodes_h_l2319_c7_4904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond,
n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue,
n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse,
n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2
BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left,
BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right,
BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a
BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left,
BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right,
BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84
BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left,
BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right,
BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output);

-- MUX_uxn_opcodes_h_l2324_c32_bc9f
MUX_uxn_opcodes_h_l2324_c32_bc9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2324_c32_bc9f_cond,
MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue,
MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse,
MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187
BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left,
BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right,
BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b
result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b
result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b
result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b
result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5
BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left,
BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right,
BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342
result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond,
result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2334_c34_1864
CONST_SR_8_uxn_opcodes_h_l2334_c34_1864 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x,
CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left,
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right,
BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711
CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output,
 t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output,
 t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output,
 t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output,
 t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output,
 t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output,
 MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output,
 CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_17dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_6564 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_ba47 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_ab45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_34d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_8194 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_f98a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_9584 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2321_c3_265a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2329_c3_1480 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2330_c24_9e19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_eaab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c24_f378_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2332_l2319_DUPLICATE_60c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2283_l2341_DUPLICATE_1489_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_eaab := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2333_c3_eaab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_ab45 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_ab45;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_9584 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_9584;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_6564 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_6564;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_f98a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_f98a;
     VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2329_c3_1480 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2329_c3_1480;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_34d7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_34d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_ba47 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_ba47;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_8194 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_8194;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_17dd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_17dd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2304_c11_beb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2296_c11_2407] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_left;
     BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output := BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2334_c34_1864] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output := CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_923a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_c5e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2319_c11_ee67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_left;
     BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output := BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2332_c11_6ac5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2324_c32_b90a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_left;
     BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output := BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_99c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2326_c11_3187] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_left;
     BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output := BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2336_c11_0712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_left;
     BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output := BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c6_9f81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2330_c24_9e19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2330_c24_9e19_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_2531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_left;
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output := BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2332_l2319_DUPLICATE_60c9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2332_l2319_DUPLICATE_60c9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_b574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_left;
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output := BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2324_c32_b90a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c6_9f81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_c5e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2296_c11_2407_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_99c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_beb3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_b574_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_2531_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_923a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2319_c11_ee67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2326_c11_3187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c11_6ac5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2336_c11_0712_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2297_l2312_l2305_l2320_DUPLICATE_1ce5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2330_c24_9e19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_afc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2326_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2336_l2304_l2332_DUPLICATE_8d8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2326_l2301_l2296_l2316_l2293_l2311_l2287_l2308_l2304_DUPLICATE_2cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2308_l2304_DUPLICATE_c3b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2336_l2304_l2332_DUPLICATE_17e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2332_l2319_DUPLICATE_60c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2332_l2319_DUPLICATE_60c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2301_l2319_l2296_l2316_l2293_l2311_l2287_l2308_l2304_l2332_DUPLICATE_cda1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2326_c7_931b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2305_c3_782f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_left;
     BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output := BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2334_c24_f378] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c24_f378_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2334_c34_1864_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2287_c1_b389] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2320_c3_11d2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_left;
     BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output := BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2336_c7_0e66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2332_c7_b342] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2324_c32_3d84] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_left;
     BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output := BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2336_c7_0e66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2324_c32_3d84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2305_c3_782f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2320_c3_11d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2334_c24_f378_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2298_l2313_DUPLICATE_a711_return_output;
     VAR_printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2287_c1_b389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2336_c7_0e66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2332_c7_b342] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;

     -- printf_uxn_opcodes_h_l2288_c3_804c[uxn_opcodes_h_l2288_c3_804c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2288_c3_804c_uxn_opcodes_h_l2288_c3_804c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2321_c11_c649] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output;

     -- n16_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2326_c7_931b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2332_c7_b342] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output := result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;

     -- MUX[uxn_opcodes_h_l2324_c32_bc9f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2324_c32_bc9f_cond <= VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_cond;
     MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue <= VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iftrue;
     MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse <= VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output := MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2332_c7_b342] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;

     -- t16_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2321_c3_265a := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2321_c11_c649_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_MUX_uxn_opcodes_h_l2324_c32_bc9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c7_b342_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue := VAR_tmp16_uxn_opcodes_h_l2321_c3_265a;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- n16_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2326_c7_931b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2326_c7_931b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2326_c7_931b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2326_c7_931b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2319_c7_4904] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;

     -- t16_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2319_c7_4904_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     -- n16_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_ca25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_ca25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- n16_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_89c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- t16_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_89c1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_fb58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_fb58_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2304_c7_fb5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2304_c7_fb5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_92d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_92d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2296_c7_afd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2296_c7_afd1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_0046] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_0046_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c2_4723] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2283_l2341_DUPLICATE_1489 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2283_l2341_DUPLICATE_1489_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c2_4723_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c2_4723_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2283_l2341_DUPLICATE_1489_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2283_l2341_DUPLICATE_1489_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
