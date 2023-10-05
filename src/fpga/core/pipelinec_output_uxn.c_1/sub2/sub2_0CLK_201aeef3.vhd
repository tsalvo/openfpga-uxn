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
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2391_c6_10db]
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2391_c1_b3fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2391_c2_ff9a]
signal t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2392_c3_cf6c[uxn_opcodes_h_l2392_c3_cf6c]
signal printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_cae7]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2397_c7_397d]
signal n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_397d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2397_c7_397d]
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2397_c7_397d]
signal t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_de62]
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2400_c7_c8a1]
signal t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_57d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2405_c7_2858]
signal n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_2858]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2405_c7_2858]
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2405_c7_2858]
signal t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2408_c11_f43d]
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2408_c7_56a7]
signal t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2409_c3_380b]
signal BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_ff3d]
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2412_c7_7ab8]
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_0396]
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2415_c7_87cf]
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_6cbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2420_c7_4431]
signal n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_4431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2420_c7_4431]
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_02cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2423_c7_03ab]
signal tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2424_c3_f0f4]
signal BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2425_c11_b128]
signal BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2428_c32_b64b]
signal BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2428_c32_c27b]
signal BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2428_c32_509c]
signal MUX_uxn_opcodes_h_l2428_c32_509c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2428_c32_509c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2428_c32_509c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2428_c32_509c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2430_c11_17c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2430_c7_3d87]
signal result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2430_c7_3d87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2430_c7_3d87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2430_c7_3d87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2430_c7_3d87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2436_c11_dae8]
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2436_c7_a9f7]
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2436_c7_a9f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2436_c7_a9f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2436_c7_a9f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2438_c34_c2f2]
signal CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2440_c11_b3d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2440_c7_7bb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c7_7bb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db
BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left,
BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right,
BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output);

-- n16_MUX_uxn_opcodes_h_l2391_c2_ff9a
n16_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a
tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- t16_MUX_uxn_opcodes_h_l2391_c2_ff9a
t16_MUX_uxn_opcodes_h_l2391_c2_ff9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond,
t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue,
t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse,
t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

-- printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c
printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c : entity work.printf_uxn_opcodes_h_l2392_c3_cf6c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output);

-- n16_MUX_uxn_opcodes_h_l2397_c7_397d
n16_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2397_c7_397d
tmp16_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- t16_MUX_uxn_opcodes_h_l2397_c7_397d
t16_MUX_uxn_opcodes_h_l2397_c7_397d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond,
t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue,
t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse,
t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output);

-- n16_MUX_uxn_opcodes_h_l2400_c7_c8a1
n16_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1
tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- t16_MUX_uxn_opcodes_h_l2400_c7_c8a1
t16_MUX_uxn_opcodes_h_l2400_c7_c8a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond,
t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue,
t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse,
t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output);

-- n16_MUX_uxn_opcodes_h_l2405_c7_2858
n16_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2405_c7_2858
tmp16_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- t16_MUX_uxn_opcodes_h_l2405_c7_2858
t16_MUX_uxn_opcodes_h_l2405_c7_2858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond,
t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue,
t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse,
t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left,
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right,
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output);

-- n16_MUX_uxn_opcodes_h_l2408_c7_56a7
n16_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7
result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7
result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7
tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- t16_MUX_uxn_opcodes_h_l2408_c7_56a7
t16_MUX_uxn_opcodes_h_l2408_c7_56a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond,
t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue,
t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse,
t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b
BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left,
BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right,
BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output);

-- n16_MUX_uxn_opcodes_h_l2412_c7_7ab8
n16_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8
tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond,
tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output);

-- n16_MUX_uxn_opcodes_h_l2415_c7_87cf
n16_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf
result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf
tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond,
tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output);

-- n16_MUX_uxn_opcodes_h_l2420_c7_4431
n16_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2420_c7_4431
tmp16_MUX_uxn_opcodes_h_l2420_c7_4431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond,
tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue,
tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse,
tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output);

-- n16_MUX_uxn_opcodes_h_l2423_c7_03ab
n16_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab
result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab
tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond,
tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4
BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left,
BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right,
BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128
BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left,
BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right,
BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b
BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left,
BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right,
BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b
BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left,
BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right,
BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output);

-- MUX_uxn_opcodes_h_l2428_c32_509c
MUX_uxn_opcodes_h_l2428_c32_509c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2428_c32_509c_cond,
MUX_uxn_opcodes_h_l2428_c32_509c_iftrue,
MUX_uxn_opcodes_h_l2428_c32_509c_iffalse,
MUX_uxn_opcodes_h_l2428_c32_509c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87
result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond,
result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87
result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left,
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right,
BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2
CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x,
CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output,
 n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output,
 n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output,
 n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output,
 n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output,
 n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output,
 n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output,
 n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output,
 n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output,
 n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output,
 MUX_uxn_opcodes_h_l2428_c32_509c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output,
 CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_ae51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_7bc7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_7ab4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_464e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_a46e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_ee5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_1d35 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_02d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2428_c32_509c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2428_c32_509c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2433_c3_f611 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2434_c24_c9dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2437_c3_8233 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2438_c24_1968_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2436_l2423_DUPLICATE_b0e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2445_l2387_DUPLICATE_a848_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_a46e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_a46e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_ee5d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_ee5d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_02d6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_02d6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_464e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_464e;
     VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_7bc7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_7bc7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_ae51 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_ae51;
     VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_7ab4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_7ab4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2437_c3_8233 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2437_c3_8233;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2433_c3_f611 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2433_c3_f611;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_1d35 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_1d35;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2391_c6_10db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_02cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2440_c11_b3d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2430_c11_17c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_cae7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_57d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2434_c24_c9dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2434_c24_c9dd_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2436_c11_dae8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2438_c34_c2f2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output := CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2436_l2423_DUPLICATE_b0e3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2436_l2423_DUPLICATE_b0e3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_ff3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_0396] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_left;
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output := BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2408_c11_f43d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2428_c32_b64b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_left;
     BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output := BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_6cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_de62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_left;
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output := BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2428_c32_b64b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c6_10db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_cae7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_de62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_57d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_f43d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_ff3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_0396_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6cbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_02cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_17c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2436_c11_dae8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c11_b3d6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2409_l2424_l2401_l2416_DUPLICATE_6483_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2434_c24_c9dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_5fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2430_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_5fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2408_l2405_l2430_l2400_l2397_l2420_l2391_l2415_l2412_DUPLICATE_e2f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2408_l2405_l2400_l2423_l2397_l2420_l2415_l2412_DUPLICATE_8e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2440_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_b065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2436_l2423_DUPLICATE_b0e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2436_l2423_DUPLICATE_b0e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2408_l2436_l2405_l2400_l2423_l2397_l2420_l2391_l2415_l2412_DUPLICATE_0e77_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c7_7bb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2391_c1_b3fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2430_c7_3d87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2424_c3_f0f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_left;
     BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output := BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2436_c7_a9f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2438_c24_1968] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2438_c24_1968_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2438_c34_c2f2_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2428_c32_c27b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_left;
     BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output := BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2409_c3_380b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_left;
     BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output := BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2440_c7_7bb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2428_c32_509c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2428_c32_c27b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2409_c3_380b_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2424_c3_f0f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2438_c24_1968_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2417_l2402_DUPLICATE_be5e_return_output;
     VAR_printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2391_c1_b3fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2440_c7_7bb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2430_c7_3d87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;

     -- MUX[uxn_opcodes_h_l2428_c32_509c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2428_c32_509c_cond <= VAR_MUX_uxn_opcodes_h_l2428_c32_509c_cond;
     MUX_uxn_opcodes_h_l2428_c32_509c_iftrue <= VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iftrue;
     MUX_uxn_opcodes_h_l2428_c32_509c_iffalse <= VAR_MUX_uxn_opcodes_h_l2428_c32_509c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2428_c32_509c_return_output := MUX_uxn_opcodes_h_l2428_c32_509c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2436_c7_a9f7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2425_c11_b128] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- n16_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- printf_uxn_opcodes_h_l2392_c3_cf6c[uxn_opcodes_h_l2392_c3_cf6c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2392_c3_cf6c_uxn_opcodes_h_l2392_c3_cf6c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2436_c7_a9f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2436_c7_a9f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2425_c11_b128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue := VAR_MUX_uxn_opcodes_h_l2428_c32_509c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2436_c7_a9f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2430_c7_3d87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output := result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;

     -- n16_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2430_c7_3d87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2430_c7_3d87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2430_c7_3d87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     -- t16_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_03ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_03ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_4431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_4431_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_87cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2415_c7_87cf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_7ab8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c7_56a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c7_56a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- n16_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2405_c7_2858] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output := result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_2858_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_c8a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2400_c7_c8a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2397_c7_397d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_397d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c2_ff9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2445_l2387_DUPLICATE_a848 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2445_l2387_DUPLICATE_a848_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c2_ff9a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2445_l2387_DUPLICATE_a848_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2445_l2387_DUPLICATE_a848_return_output;
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
