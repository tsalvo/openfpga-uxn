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
-- Submodules: 114
entity mul2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_df1f1450;
architecture arch of mul2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2173_c6_753a]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2173_c1_c634]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2173_c2_641a]
signal n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c2_641a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2173_c2_641a]
signal tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2173_c2_641a]
signal t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2174_c3_bb2b[uxn_opcodes_h_l2174_c3_bb2b]
signal printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_dbb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2178_c7_8d00]
signal t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_e05d]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_f8e9]
signal t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2186_c11_6045]
signal BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2186_c7_5d7b]
signal t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_f5dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2189_c7_6de0]
signal t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2190_c3_4d9b]
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_c33a]
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2193_c7_a1a2]
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_a341]
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2196_c7_a5d0]
signal tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2201_c11_5da4]
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2201_c7_d700]
signal n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2201_c7_d700]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2201_c7_d700]
signal tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2204_c11_7d6a]
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2204_c7_9035]
signal n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2204_c7_9035]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2204_c7_9035]
signal tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2205_c3_d5b9]
signal BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2206_c11_8025]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2208_c32_3156]
signal BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2208_c32_c1b3]
signal BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2208_c32_19ea]
signal MUX_uxn_opcodes_h_l2208_c32_19ea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2208_c32_19ea_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2210_c11_dada]
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2210_c7_006f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2210_c7_006f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2210_c7_006f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2210_c7_006f]
signal result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2210_c7_006f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2216_c11_6d85]
signal BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2216_c7_cd74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2216_c7_cd74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2216_c7_cd74]
signal result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2216_c7_cd74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2218_c34_9466]
signal CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_ae8c]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_e7eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_e7eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a
BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output);

-- n16_MUX_uxn_opcodes_h_l2173_c2_641a
n16_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a
result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2173_c2_641a
tmp16_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- t16_MUX_uxn_opcodes_h_l2173_c2_641a
t16_MUX_uxn_opcodes_h_l2173_c2_641a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond,
t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue,
t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse,
t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

-- printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b
printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b : entity work.printf_uxn_opcodes_h_l2174_c3_bb2b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output);

-- n16_MUX_uxn_opcodes_h_l2178_c7_8d00
n16_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00
tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- t16_MUX_uxn_opcodes_h_l2178_c7_8d00
t16_MUX_uxn_opcodes_h_l2178_c7_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond,
t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue,
t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse,
t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output);

-- n16_MUX_uxn_opcodes_h_l2181_c7_f8e9
n16_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9
tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_f8e9
t16_MUX_uxn_opcodes_h_l2181_c7_f8e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045
BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left,
BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right,
BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output);

-- n16_MUX_uxn_opcodes_h_l2186_c7_5d7b
n16_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b
tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- t16_MUX_uxn_opcodes_h_l2186_c7_5d7b
t16_MUX_uxn_opcodes_h_l2186_c7_5d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond,
t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue,
t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse,
t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2189_c7_6de0
n16_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0
tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- t16_MUX_uxn_opcodes_h_l2189_c7_6de0
t16_MUX_uxn_opcodes_h_l2189_c7_6de0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond,
t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue,
t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse,
t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b
BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output);

-- n16_MUX_uxn_opcodes_h_l2193_c7_a1a2
n16_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2
tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output);

-- n16_MUX_uxn_opcodes_h_l2196_c7_a5d0
n16_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0
tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond,
tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left,
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right,
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output);

-- n16_MUX_uxn_opcodes_h_l2201_c7_d700
n16_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700
result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700
result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700
result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2201_c7_d700
tmp16_MUX_uxn_opcodes_h_l2201_c7_d700 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond,
tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue,
tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse,
tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left,
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right,
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output);

-- n16_MUX_uxn_opcodes_h_l2204_c7_9035
n16_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035
result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035
result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2204_c7_9035
tmp16_MUX_uxn_opcodes_h_l2204_c7_9035 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond,
tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue,
tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse,
tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9
BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left,
BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right,
BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156
BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left,
BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right,
BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3
BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left,
BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right,
BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output);

-- MUX_uxn_opcodes_h_l2208_c32_19ea
MUX_uxn_opcodes_h_l2208_c32_19ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2208_c32_19ea_cond,
MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue,
MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse,
MUX_uxn_opcodes_h_l2208_c32_19ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left,
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right,
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f
result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f
result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85
BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left,
BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right,
BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74
result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74
result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond,
result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74
result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2218_c34_9466
CONST_SR_8_uxn_opcodes_h_l2218_c34_9466 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x,
CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2
CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output,
 n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output,
 n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output,
 n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output,
 n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output,
 n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output,
 n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output,
 n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output,
 n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output,
 n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output,
 MUX_uxn_opcodes_h_l2208_c32_19ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output,
 CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_52f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_e3fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2184_c3_3ffd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_2700 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_56cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_c97e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_775e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_599a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2206_c3_01c8 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_734b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2214_c24_173a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_9959_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2216_l2204_DUPLICATE_dc3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2225_l2169_DUPLICATE_3f03_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d0b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d0b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2184_c3_3ffd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2184_c3_3ffd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_52f8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2175_c3_52f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_734b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_734b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_775e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_775e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_2700 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_2700;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_c97e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_c97e;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_56cb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_56cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_e3fe := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_e3fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_599a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_599a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2186_c11_6045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_left;
     BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output := BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2210_c11_dada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_left;
     BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output := BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c6_753a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_ae8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_e05d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_f5dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2216_c11_6d85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2216_l2204_DUPLICATE_dc3d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2216_l2204_DUPLICATE_dc3d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_dbb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_a341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_left;
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output := BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2218_c34_9466] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output := CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2201_c11_5da4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2214_c24_173a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2214_c24_173a_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_c33a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2208_c32_3156] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_left;
     BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output := BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2204_c11_7d6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2208_c32_3156_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c6_753a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_dbb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_e05d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2186_c11_6045_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_f5dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c33a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_a341_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_5da4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_7d6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_dada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2216_c11_6d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ae8c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2205_l2197_l2190_DUPLICATE_4194_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2214_c24_173a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2181_l2204_DUPLICATE_595f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2178_l2201_l2196_l2193_l2220_l2189_l2216_l2186_l2210_l2181_l2204_DUPLICATE_3b1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2186_l2210_l2181_DUPLICATE_bb85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2220_l2189_l2216_l2186_l2181_l2204_DUPLICATE_0904_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2216_l2204_DUPLICATE_dc3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2216_l2204_DUPLICATE_dc3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2178_l2201_l2173_l2196_l2193_l2189_l2216_l2186_l2181_l2204_DUPLICATE_93ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2173_c1_c634] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_e7eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2216_c7_cd74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2205_c3_d5b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_left;
     BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output := BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2190_c3_4d9b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_left;
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output := BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2208_c32_c1b3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_left;
     BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output := BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2210_c7_006f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_e7eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2218_c24_9959] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_9959_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2218_c34_9466_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2208_c32_c1b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_4d9b_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2205_c3_d5b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_9959_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2198_l2183_DUPLICATE_fad2_return_output;
     VAR_printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2173_c1_c634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e7eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;
     -- MUX[uxn_opcodes_h_l2208_c32_19ea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2208_c32_19ea_cond <= VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_cond;
     MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue <= VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iftrue;
     MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse <= VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_return_output := MUX_uxn_opcodes_h_l2208_c32_19ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2216_c7_cd74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;

     -- n16_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- t16_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2206_c11_8025] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2216_c7_cd74] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output := result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2210_c7_006f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2216_c7_cd74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;

     -- printf_uxn_opcodes_h_l2174_c3_bb2b[uxn_opcodes_h_l2174_c3_bb2b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2174_c3_bb2b_uxn_opcodes_h_l2174_c3_bb2b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2206_c3_01c8 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2206_c11_8025_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_MUX_uxn_opcodes_h_l2208_c32_19ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2216_c7_cd74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue := VAR_tmp16_uxn_opcodes_h_l2206_c3_01c8;
     -- result_stack_value_MUX[uxn_opcodes_h_l2210_c7_006f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2210_c7_006f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2210_c7_006f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- n16_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- t16_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2210_c7_006f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     -- n16_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2204_c7_9035] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2204_c7_9035_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- n16_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2201_c7_d700] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2201_c7_d700_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c7_a5d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_a5d0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_a1a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a1a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2189_c7_6de0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2189_c7_6de0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2186_c7_5d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2186_c7_5d7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2181_c7_f8e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_f8e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_8d00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_8d00_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c2_641a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2225_l2169_DUPLICATE_3f03 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2225_l2169_DUPLICATE_3f03_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c2_641a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c2_641a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2225_l2169_DUPLICATE_3f03_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2225_l2169_DUPLICATE_3f03_return_output;
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
