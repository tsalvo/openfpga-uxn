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
-- Submodules: 107
entity ora2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_a7b4806f;
architecture arch of ora2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1081_c6_0cc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1081_c1_a62f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1081_c2_de93]
signal t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1081_c2_de93]
signal tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c2_de93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1081_c2_de93]
signal n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1082_c3_2659[uxn_opcodes_h_l1082_c3_2659]
signal printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1086_c11_342a]
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1086_c7_b82d]
signal n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_89fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1089_c7_ab39]
signal n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1094_c11_8f0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1094_c7_92db]
signal t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1094_c7_92db]
signal tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1094_c7_92db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1094_c7_92db]
signal n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_be60]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1097_c7_b5e2]
signal n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1098_c3_8707]
signal BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_fa65]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1101_c7_36ef]
signal n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_e859]
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1104_c7_028d]
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_028d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1104_c7_028d]
signal n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1109_c11_5ed5]
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1109_c7_46ce]
signal n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1112_c11_63ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1112_c7_5317]
signal tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c7_5317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1112_c7_5317]
signal n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1113_c3_5182]
signal BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1114_c11_a719]
signal BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1116_c30_f86d]
signal sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_6b71]
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1121_c7_96a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1121_c7_96a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_96a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_96a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1121_c7_96a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1124_c31_4615]
signal CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1126_c11_62c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1126_c7_6fa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1126_c7_6fa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8
BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output);

-- t16_MUX_uxn_opcodes_h_l1081_c2_de93
t16_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1081_c2_de93
tmp16_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93
result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- n16_MUX_uxn_opcodes_h_l1081_c2_de93
n16_MUX_uxn_opcodes_h_l1081_c2_de93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond,
n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue,
n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse,
n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

-- printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659
printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659 : entity work.printf_uxn_opcodes_h_l1082_c3_2659_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left,
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right,
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output);

-- t16_MUX_uxn_opcodes_h_l1086_c7_b82d
t16_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d
tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d
result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- n16_MUX_uxn_opcodes_h_l1086_c7_b82d
n16_MUX_uxn_opcodes_h_l1086_c7_b82d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond,
n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue,
n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse,
n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_ab39
t16_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39
tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- n16_MUX_uxn_opcodes_h_l1089_c7_ab39
n16_MUX_uxn_opcodes_h_l1089_c7_ab39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond,
n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue,
n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse,
n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output);

-- t16_MUX_uxn_opcodes_h_l1094_c7_92db
t16_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1094_c7_92db
tmp16_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db
result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db
result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- n16_MUX_uxn_opcodes_h_l1094_c7_92db
n16_MUX_uxn_opcodes_h_l1094_c7_92db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond,
n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue,
n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse,
n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output);

-- t16_MUX_uxn_opcodes_h_l1097_c7_b5e2
t16_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2
tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- n16_MUX_uxn_opcodes_h_l1097_c7_b5e2
n16_MUX_uxn_opcodes_h_l1097_c7_b5e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond,
n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue,
n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse,
n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707
BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left,
BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right,
BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef
tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- n16_MUX_uxn_opcodes_h_l1101_c7_36ef
n16_MUX_uxn_opcodes_h_l1101_c7_36ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond,
n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue,
n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse,
n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1104_c7_028d
tmp16_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- n16_MUX_uxn_opcodes_h_l1104_c7_028d
n16_MUX_uxn_opcodes_h_l1104_c7_028d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond,
n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue,
n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse,
n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left,
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right,
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce
tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce
result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1109_c7_46ce
n16_MUX_uxn_opcodes_h_l1109_c7_46ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond,
n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue,
n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse,
n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac
BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1112_c7_5317
tmp16_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317
result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317
result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- n16_MUX_uxn_opcodes_h_l1112_c7_5317
n16_MUX_uxn_opcodes_h_l1112_c7_5317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond,
n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue,
n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse,
n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182
BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left,
BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right,
BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719
BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left,
BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right,
BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d
sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins,
sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x,
sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y,
sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7
result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1124_c31_4615
CONST_SR_8_uxn_opcodes_h_l1124_c31_4615 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x,
CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48
CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output,
 t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output,
 t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output,
 t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output,
 t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output,
 tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output,
 sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_05b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_64af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_a084 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_3535 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0862 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_446f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_8607 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_74d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_1507 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_d167_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_6e63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1121_c7_96a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1124_c21_c166_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1131_l1077_DUPLICATE_1253_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_05b1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_05b1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_a084 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_a084;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_3535 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_3535;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_1507 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_1507;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_64af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_64af;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_74d1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_74d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_446f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_446f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_6e63 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1123_c3_6e63;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_8607 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_8607;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0862 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0862;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_89fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1116_c30_f86d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_ins;
     sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_x;
     sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output := sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_6b71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1126_c11_62c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_e859] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_left;
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output := BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1086_c11_342a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1109_c11_5ed5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1112_c11_63ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1094_c11_8f0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_be60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1121_c7_96a7_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c6_0cc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l1124_c31_4615] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output := CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_fa65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c6_0cc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_342a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_89fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8f0f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_be60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_fa65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_e859_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_5ed5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c11_63ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_6b71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_62c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1105_l1098_l1113_DUPLICATE_8633_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1089_l1112_l1086_l1109_DUPLICATE_4f4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1112_l1086_l1109_DUPLICATE_b405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_d479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1126_l1094_l1121_l1089_l1086_l1109_DUPLICATE_9c4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1081_l1104_l1101_l1097_l1094_l1121_l1089_l1086_l1109_DUPLICATE_471e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1121_c7_96a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1116_c30_f86d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1113_c3_5182] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_left;
     BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output := BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1124_c21_c166] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1124_c21_c166_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1124_c31_4615_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1081_c1_a62f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1126_c7_6fa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1126_c7_6fa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1098_c3_8707] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_left;
     BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output := BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1098_c3_8707_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1113_c3_5182_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1124_c21_c166_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1091_l1106_DUPLICATE_1d48_return_output;
     VAR_printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1081_c1_a62f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_6fa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1114_c11_a719] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_left;
     BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output := BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- printf_uxn_opcodes_h_l1082_c3_2659[uxn_opcodes_h_l1082_c3_2659] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1082_c3_2659_uxn_opcodes_h_l1082_c3_2659_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1121_c7_96a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- t16_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1121_c7_96a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- t16_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- n16_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1119_c21_d167] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_d167_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1114_c11_a719_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_d167_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1112_c7_5317] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output := result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c7_5317_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     -- t16_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1109_c7_46ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1109_c7_46ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_028d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- t16_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_028d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1101_c7_36ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- n16_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_36ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_b5e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- n16_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_b5e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- n16_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1094_c7_92db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output := result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1094_c7_92db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- n16_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_ab39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output := result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_ab39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1086_c7_b82d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1086_c7_b82d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1081_c2_de93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output := result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1131_l1077_DUPLICATE_1253 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1131_l1077_DUPLICATE_1253_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c2_de93_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c2_de93_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1131_l1077_DUPLICATE_1253_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1131_l1077_DUPLICATE_1253_return_output;
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
