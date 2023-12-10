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
-- Submodules: 71
entity eor2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_4712a73c;
architecture arch of eor2_0CLK_4712a73c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1091_c6_44c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1091_c2_4c52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_3eef]
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_e4d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_b80c]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_6e5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1106_c11_154b]
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1106_c7_06ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1107_c3_3603]
signal BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_8ba8]
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1110_c7_a415]
signal n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1110_c7_a415]
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1110_c7_a415]
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_a415]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_a415]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_a415]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_a415]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1114_c11_9f07]
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1114_c7_0f1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1115_c3_75c3]
signal BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1116_c11_f5b4]
signal BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1118_c30_35f7]
signal sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_dddd]
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1123_c7_ee2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_ee2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_ee2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_ee2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_ee2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1126_c31_a0ca]
signal CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_16b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_1a37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_1a37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6
BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output);

-- n16_MUX_uxn_opcodes_h_l1091_c2_4c52
n16_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- t16_MUX_uxn_opcodes_h_l1091_c2_4c52
t16_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52
tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52
result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52
result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output);

-- n16_MUX_uxn_opcodes_h_l1098_c7_e4d7
n16_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- t16_MUX_uxn_opcodes_h_l1098_c7_e4d7
t16_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7
tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7
result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output);

-- n16_MUX_uxn_opcodes_h_l1101_c7_6e5d
n16_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- t16_MUX_uxn_opcodes_h_l1101_c7_6e5d
t16_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d
tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left,
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right,
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output);

-- n16_MUX_uxn_opcodes_h_l1106_c7_06ef
n16_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- t16_MUX_uxn_opcodes_h_l1106_c7_06ef
t16_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef
tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef
result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603
BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left,
BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right,
BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output);

-- n16_MUX_uxn_opcodes_h_l1110_c7_a415
n16_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1110_c7_a415
tmp16_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left,
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right,
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output);

-- n16_MUX_uxn_opcodes_h_l1114_c7_0f1c
n16_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c
tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c
result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3
BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left,
BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right,
BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4
BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left,
BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right,
BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7
sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins,
sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x,
sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y,
sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d
result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca
CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x,
CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed
CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output,
 n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output,
 n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output,
 n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output,
 n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output,
 n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output,
 n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_f26b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_269b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_fefa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_debe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_fdd5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1121_c21_ec11_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_39fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1124_c3_8f6d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c21_4834_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1110_l1123_DUPLICATE_7548_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1133_l1087_DUPLICATE_3d70_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_39fa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_39fa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_debe := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_debe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_269b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_269b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1124_c3_8f6d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1124_c3_8f6d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_fefa := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_fefa;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_f26b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_f26b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_fdd5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_fdd5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1114_c11_9f07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_3eef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_b80c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_8ba8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_16b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_dddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1118_c30_35f7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_ins;
     sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_x;
     sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output := sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1091_c6_44c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1110_l1123_DUPLICATE_7548 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1110_l1123_DUPLICATE_7548_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1126_c31_a0ca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output := CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1106_c11_154b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c6_44c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_3eef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b80c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_154b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_8ba8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_9f07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_dddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_16b1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1115_l1111_l1107_DUPLICATE_33f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_8ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1098_l1110_l1114_l1123_l1101_l1128_l1106_DUPLICATE_56c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1128_l1106_DUPLICATE_e882_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1110_l1123_DUPLICATE_7548_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1110_l1123_DUPLICATE_7548_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1098_l1110_l1091_l1123_l1101_l1106_DUPLICATE_5fcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1118_c30_35f7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_1a37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_1a37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_ee2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1126_c21_4834] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c21_4834_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1126_c31_a0ca_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1107_c3_3603] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_left;
     BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output := BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_ee2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1115_c3_75c3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_left;
     BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output := BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1107_c3_3603_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1115_c3_75c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1126_c21_4834_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1103_l1112_DUPLICATE_06ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_1a37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l1116_c11_f5b4] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_left;
     BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output := BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1123_c7_ee2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_ee2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_ee2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1123_c7_ee2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1121_c21_ec11] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1121_c21_ec11_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1116_c11_f5b4_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1121_c21_ec11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- t16_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- n16_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1114_c7_0f1c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1114_c7_0f1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1110_c7_a415] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output := result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_a415_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1106_c7_06ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1106_c7_06ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1101_c7_6e5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1101_c7_6e5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1098_c7_e4d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1098_c7_e4d7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1091_c2_4c52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output := result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1133_l1087_DUPLICATE_3d70 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1133_l1087_DUPLICATE_3d70_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1091_c2_4c52_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1133_l1087_DUPLICATE_3d70_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1133_l1087_DUPLICATE_3d70_return_output;
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
