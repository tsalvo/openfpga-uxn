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
-- BIN_OP_EQ[uxn_opcodes_h_l2263_c6_3e53]
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2263_c1_9f29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2263_c2_5f30]
signal tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2264_c3_540b[uxn_opcodes_h_l2264_c3_540b]
signal printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_8cee]
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2269_c7_14e0]
signal tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_b224]
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2272_c7_3dc0]
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2277_c11_7f6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2277_c7_75fc]
signal tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2280_c11_c301]
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2280_c7_07eb]
signal tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2281_c3_8ffc]
signal BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_7623]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2284_c7_aab7]
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_7673]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c7_ec02]
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_d428]
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2292_c7_e225]
signal n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2292_c7_e225]
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2292_c7_e225]
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2295_c11_c0b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2295_c7_f3fb]
signal tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2296_c3_f7ff]
signal BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2297_c11_6830]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2300_c32_8d5d]
signal BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2300_c32_6cb1]
signal BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2300_c32_6972]
signal MUX_uxn_opcodes_h_l2300_c32_6972_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2300_c32_6972_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2300_c32_6972_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2300_c32_6972_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_05a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_d806]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_d806]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_d806]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_d806]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_d806]
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_7d35]
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_c0be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_c0be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_c0be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_c0be]
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2310_c34_7ed8]
signal CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2312_c11_f659]
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2312_c7_efa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c7_efa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53
BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left,
BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right,
BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output);

-- n16_MUX_uxn_opcodes_h_l2263_c2_5f30
n16_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30
result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- t16_MUX_uxn_opcodes_h_l2263_c2_5f30
t16_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30
tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond,
tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue,
tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse,
tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

-- printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b
printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b : entity work.printf_uxn_opcodes_h_l2264_c3_540b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output);

-- n16_MUX_uxn_opcodes_h_l2269_c7_14e0
n16_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0
result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- t16_MUX_uxn_opcodes_h_l2269_c7_14e0
t16_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0
tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond,
tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output);

-- n16_MUX_uxn_opcodes_h_l2272_c7_3dc0
n16_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0
result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- t16_MUX_uxn_opcodes_h_l2272_c7_3dc0
t16_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0
tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond,
tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c
BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output);

-- n16_MUX_uxn_opcodes_h_l2277_c7_75fc
n16_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc
result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc
result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc
result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc
result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc
result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- t16_MUX_uxn_opcodes_h_l2277_c7_75fc
t16_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc
tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond,
tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left,
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right,
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output);

-- n16_MUX_uxn_opcodes_h_l2280_c7_07eb
n16_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb
result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb
result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb
result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- t16_MUX_uxn_opcodes_h_l2280_c7_07eb
t16_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb
tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond,
tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc
BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left,
BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right,
BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output);

-- n16_MUX_uxn_opcodes_h_l2284_c7_aab7
n16_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7
result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7
result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7
result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7
tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond,
tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c7_ec02
n16_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02
tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output);

-- n16_MUX_uxn_opcodes_h_l2292_c7_e225
n16_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225
result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2292_c7_e225
tmp16_MUX_uxn_opcodes_h_l2292_c7_e225 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond,
tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue,
tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse,
tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output);

-- n16_MUX_uxn_opcodes_h_l2295_c7_f3fb
n16_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb
result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb
tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond,
tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff
BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left,
BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right,
BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d
BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left,
BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right,
BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1
BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left,
BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right,
BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output);

-- MUX_uxn_opcodes_h_l2300_c32_6972
MUX_uxn_opcodes_h_l2300_c32_6972 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2300_c32_6972_cond,
MUX_uxn_opcodes_h_l2300_c32_6972_iftrue,
MUX_uxn_opcodes_h_l2300_c32_6972_iffalse,
MUX_uxn_opcodes_h_l2300_c32_6972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8
CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x,
CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left,
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right,
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c
CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output,
 n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output,
 n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output,
 n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output,
 n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output,
 n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output,
 n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output,
 n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output,
 n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output,
 MUX_uxn_opcodes_h_l2300_c32_6972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output,
 CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_ea5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_701f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2275_c3_0d83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_d3bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_559b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_0eee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_bed2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2293_c3_e92b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2297_c3_72e4 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2300_c32_6972_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2300_c32_6972_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_564c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2306_c24_c181_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_ac4c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2310_c24_f9f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2295_DUPLICATE_cadb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2317_l2259_DUPLICATE_2b27_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_564c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_564c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2275_c3_0d83 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2275_c3_0d83;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_ea5c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_ea5c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_0eee := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_0eee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_559b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_559b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_701f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_701f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_bed2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2290_c3_bed2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_d3bd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_d3bd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2293_c3_e92b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2293_c3_e92b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_ac4c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2309_c3_ac4c;
     VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right := to_unsigned(10, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_05a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2277_c11_7f6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_7d35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_8cee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_7673] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2280_c11_c301] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_left;
     BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output := BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2295_c11_c0b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_d428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_left;
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output := BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2306_c24_c181] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2306_c24_c181_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2263_c6_3e53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2295_DUPLICATE_cadb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2295_DUPLICATE_cadb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2300_c32_8d5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_left;
     BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output := BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_7623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2312_c11_f659] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_left;
     BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output := BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2310_c34_7ed8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output := CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_b224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_left;
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output := BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2300_c32_8d5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c6_3e53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_8cee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_b224_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2277_c11_7f6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_c301_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_7623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_7673_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_d428_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_c0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_05a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_7d35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_f659_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2288_l2281_l2296_DUPLICATE_b2c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2306_c24_c181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2277_DUPLICATE_3535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2312_l2280_l2308_l2277_l2302_DUPLICATE_ec7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2272_l2269_l2292_l2263_l2287_l2284_l2280_l2277_l2302_DUPLICATE_c770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2287_l2284_l2280_l2277_DUPLICATE_34e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2312_l2280_l2308_l2277_DUPLICATE_f52b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2295_DUPLICATE_cadb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2295_DUPLICATE_cadb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2272_l2295_l2269_l2292_l2263_l2287_l2284_l2280_l2308_l2277_DUPLICATE_898c_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2310_c24_f9f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2310_c24_f9f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2310_c34_7ed8_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2296_c3_f7ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_left;
     BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output := BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2281_c3_8ffc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_left;
     BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output := BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_c0be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2300_c32_6cb1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_left;
     BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output := BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2312_c7_efa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_d806] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2263_c1_9f29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c7_efa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2300_c32_6972_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2300_c32_6cb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2281_c3_8ffc_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2296_c3_f7ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2310_c24_f9f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2289_l2274_DUPLICATE_b26c_return_output;
     VAR_printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2263_c1_9f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2312_c7_efa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2297_c11_6830] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- printf_uxn_opcodes_h_l2264_c3_540b[uxn_opcodes_h_l2264_c3_540b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2264_c3_540b_uxn_opcodes_h_l2264_c3_540b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_c0be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_c0be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_d806] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;

     -- t16_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- MUX[uxn_opcodes_h_l2300_c32_6972] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2300_c32_6972_cond <= VAR_MUX_uxn_opcodes_h_l2300_c32_6972_cond;
     MUX_uxn_opcodes_h_l2300_c32_6972_iftrue <= VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iftrue;
     MUX_uxn_opcodes_h_l2300_c32_6972_iffalse <= VAR_MUX_uxn_opcodes_h_l2300_c32_6972_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2300_c32_6972_return_output := MUX_uxn_opcodes_h_l2300_c32_6972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_c0be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output := result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2297_c3_72e4 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2297_c11_6830_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_MUX_uxn_opcodes_h_l2300_c32_6972_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_c0be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue := VAR_tmp16_uxn_opcodes_h_l2297_c3_72e4;
     -- tmp16_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_d806] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_d806] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output := result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- t16_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_d806] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;

     -- n16_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_d806_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2295_c7_f3fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2295_c7_f3fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     -- t16_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_e225] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c7_e225_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     -- n16_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_ec02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;

     -- t16_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ec02_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_aab7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2284_c7_aab7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2280_c7_07eb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2280_c7_07eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2277_c7_75fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2277_c7_75fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_3dc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2272_c7_3dc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_14e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_14e0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2263_c2_5f30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output := result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2317_l2259_DUPLICATE_2b27 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2317_l2259_DUPLICATE_2b27_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c2_5f30_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2317_l2259_DUPLICATE_2b27_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2317_l2259_DUPLICATE_2b27_return_output;
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
