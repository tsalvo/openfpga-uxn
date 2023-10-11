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
-- Submodules: 97
entity sft2_0CLK_cb029fa9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_cb029fa9;
architecture arch of sft2_0CLK_cb029fa9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2444_c6_7fec]
signal BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2444_c1_e0a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2444_c2_845d]
signal t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2444_c2_845d]
signal n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2444_c2_845d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2444_c2_845d]
signal tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2445_c3_6c6d[uxn_opcodes_h_l2445_c3_6c6d]
signal printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2449_c11_33c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2449_c7_b6a4]
signal tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2452_c11_3d9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2452_c7_f1c3]
signal tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_d957]
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2456_c7_79f3]
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_9144]
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2459_c7_bb36]
signal tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2461_c3_8e82]
signal CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_51b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2464_c7_e0e3]
signal tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_7bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2467_c7_5eef]
signal tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2468_c3_df98]
signal BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2470_c32_a858]
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2470_c32_7a0e]
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2470_c32_8551]
signal MUX_uxn_opcodes_h_l2470_c32_8551_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_8551_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_8551_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_8551_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_c0f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2472_c7_e5c5]
signal tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2473_c20_f832]
signal BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2473_c12_e12d]
signal BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2473_c36_b81c]
signal CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2473_c12_beb4]
signal BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_337f]
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_fe14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_fe14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2479_c7_fe14]
signal result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_fe14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2481_c34_5733]
signal CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_c41c]
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_7038]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_7038]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec
BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left,
BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right,
BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output);

-- t8_MUX_uxn_opcodes_h_l2444_c2_845d
t8_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- n16_MUX_uxn_opcodes_h_l2444_c2_845d
n16_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d
result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d
result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d
result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d
result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2444_c2_845d
tmp16_MUX_uxn_opcodes_h_l2444_c2_845d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond,
tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

-- printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d
printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d : entity work.printf_uxn_opcodes_h_l2445_c3_6c6d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output);

-- t8_MUX_uxn_opcodes_h_l2449_c7_b6a4
t8_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- n16_MUX_uxn_opcodes_h_l2449_c7_b6a4
n16_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4
tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond,
tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b
BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output);

-- t8_MUX_uxn_opcodes_h_l2452_c7_f1c3
t8_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2452_c7_f1c3
n16_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3
tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond,
tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output);

-- n16_MUX_uxn_opcodes_h_l2456_c7_79f3
n16_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3
tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond,
tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output);

-- n16_MUX_uxn_opcodes_h_l2459_c7_bb36
n16_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36
tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond,
tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue,
tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse,
tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82
CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x,
CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output);

-- n16_MUX_uxn_opcodes_h_l2464_c7_e0e3
n16_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3
tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond,
tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output);

-- n16_MUX_uxn_opcodes_h_l2467_c7_5eef
n16_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef
tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond,
tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue,
tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse,
tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98
BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left,
BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right,
BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858
BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left,
BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right,
BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e
BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left,
BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right,
BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output);

-- MUX_uxn_opcodes_h_l2470_c32_8551
MUX_uxn_opcodes_h_l2470_c32_8551 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2470_c32_8551_cond,
MUX_uxn_opcodes_h_l2470_c32_8551_iftrue,
MUX_uxn_opcodes_h_l2470_c32_8551_iffalse,
MUX_uxn_opcodes_h_l2470_c32_8551_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5
tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond,
tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832
BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left,
BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right,
BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d
BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left,
BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right,
BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c
CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x,
CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4
BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left,
BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right,
BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14
result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond,
result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2481_c34_5733
CONST_SR_8_uxn_opcodes_h_l2481_c34_5733 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x,
CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output,
 t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output,
 t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output,
 t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output,
 n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output,
 n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output,
 CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output,
 n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output,
 n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output,
 MUX_uxn_opcodes_h_l2470_c32_8551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output,
 CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output,
 CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_75e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_b2da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_07f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_d775 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_6257 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_d09c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_8551_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_8551_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_8fef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c24_b41c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_4e30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_cab1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2468_DUPLICATE_6339_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2479_l2467_DUPLICATE_d283_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2439_l2488_DUPLICATE_2102_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_8fef := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_8fef;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_07f4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_07f4;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_d09c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_d09c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_6257 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_6257;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_d775 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_d775;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_b2da := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_b2da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_75e9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_75e9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_4e30 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_4e30;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l2470_c32_a858] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_left;
     BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output := BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2473_c36_b81c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output := CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_51b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_9144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_left;
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output := BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_c41c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_337f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2452_c11_3d9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_7bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2479_l2467_DUPLICATE_d283 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2479_l2467_DUPLICATE_d283_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2449_c11_33c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2473_c20_f832] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_left;
     BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output := BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2481_c34_5733] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output := CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_d957] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_left;
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output := BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_c0f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2444_c6_7fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2468_DUPLICATE_6339 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2468_DUPLICATE_6339_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_a858_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2473_c20_f832_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2444_c6_7fec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2449_c11_33c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c11_3d9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_d957_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_9144_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_51b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_7bf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_c0f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_337f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_c41c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2468_DUPLICATE_6339_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2468_DUPLICATE_6339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2444_l2467_DUPLICATE_211e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2472_l2467_DUPLICATE_a2a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2449_l2472_l2444_DUPLICATE_5da9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2483_l2452_l2479_l2449_l2444_l2467_DUPLICATE_224e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2479_l2467_DUPLICATE_d283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2479_l2467_DUPLICATE_d283_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2452_l2479_l2449_l2444_l2467_DUPLICATE_6cfe_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right := VAR_CONST_SR_4_uxn_opcodes_h_l2473_c36_b81c_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2461_c3_8e82] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output := CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2481_c24_cab1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_cab1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2481_c34_5733_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2470_c32_7a0e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_left;
     BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output := BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2444_c1_e0a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2473_c12_e12d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_left;
     BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output := BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_7038] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_fe14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2468_c3_df98] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_left;
     BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output := BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_7038] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2470_c32_8551_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_7a0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2468_c3_df98_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2473_c12_e12d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_cab1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2461_c3_8e82_return_output;
     VAR_printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2444_c1_e0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2473_c12_beb4] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_left;
     BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output := BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output;

     -- MUX[uxn_opcodes_h_l2470_c32_8551] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2470_c32_8551_cond <= VAR_MUX_uxn_opcodes_h_l2470_c32_8551_cond;
     MUX_uxn_opcodes_h_l2470_c32_8551_iftrue <= VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iftrue;
     MUX_uxn_opcodes_h_l2470_c32_8551_iffalse <= VAR_MUX_uxn_opcodes_h_l2470_c32_8551_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2470_c32_8551_return_output := MUX_uxn_opcodes_h_l2470_c32_8551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2479_c7_fe14] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output := result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;

     -- printf_uxn_opcodes_h_l2445_c3_6c6d[uxn_opcodes_h_l2445_c3_6c6d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2445_c3_6c6d_uxn_opcodes_h_l2445_c3_6c6d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_fe14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_fe14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;

     -- n16_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue := VAR_MUX_uxn_opcodes_h_l2470_c32_8551_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2479_c7_fe14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     -- n16_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2477_c24_b41c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c24_b41c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2473_c12_beb4_return_output);

     -- t8_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c24_b41c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     -- n16_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_e5c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_e5c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2467_c7_5eef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;

     -- n16_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_5eef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- n16_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2464_c7_e0e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_e0e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     -- n16_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2459_c7_bb36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output := result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2459_c7_bb36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_79f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_79f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2452_c7_f1c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c7_f1c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2449_c7_b6a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2449_c7_b6a4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2444_c2_845d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2439_l2488_DUPLICATE_2102 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2439_l2488_DUPLICATE_2102_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2444_c2_845d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2444_c2_845d_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2439_l2488_DUPLICATE_2102_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2439_l2488_DUPLICATE_2102_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
