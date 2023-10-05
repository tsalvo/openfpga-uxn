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
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1180_c6_aa1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1180_c1_969d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1180_c2_d5c2]
signal t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1181_c3_3264[uxn_opcodes_h_l1181_c3_3264]
signal printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_9113]
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1186_c7_a2f1]
signal t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_213c]
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1189_c7_9608]
signal n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_9608]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1189_c7_9608]
signal t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_d2b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1194_c7_854d]
signal n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_854d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1194_c7_854d]
signal t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_0e6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c7_8ae3]
signal t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1198_c3_e4de]
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1201_c11_b663]
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1201_c7_9523]
signal n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1201_c7_9523]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1204_c11_7c33]
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1204_c7_6252]
signal n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c7_6252]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_8a57]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1209_c7_a055]
signal n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_a055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_df27]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_4bf9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1213_c3_d6c8]
signal BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1216_c32_c0e4]
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1216_c32_b249]
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1216_c32_3c57]
signal MUX_uxn_opcodes_h_l1216_c32_3c57_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1216_c32_3c57_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_3172]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_4d79]
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_4d79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_4d79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_4d79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_4d79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c24_0093]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1222_c24_7b92]
signal MUX_uxn_opcodes_h_l1222_c24_7b92_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1222_c24_7b92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_02ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_12b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_12b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c
BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c2_d5c2
n16_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- t16_MUX_uxn_opcodes_h_l1180_c2_d5c2
t16_MUX_uxn_opcodes_h_l1180_c2_d5c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond,
t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue,
t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse,
t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

-- printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264
printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264 : entity work.printf_uxn_opcodes_h_l1181_c3_3264_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output);

-- n16_MUX_uxn_opcodes_h_l1186_c7_a2f1
n16_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- t16_MUX_uxn_opcodes_h_l1186_c7_a2f1
t16_MUX_uxn_opcodes_h_l1186_c7_a2f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond,
t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue,
t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse,
t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output);

-- n16_MUX_uxn_opcodes_h_l1189_c7_9608
n16_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608
result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608
result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- t16_MUX_uxn_opcodes_h_l1189_c7_9608
t16_MUX_uxn_opcodes_h_l1189_c7_9608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond,
t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue,
t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse,
t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1194_c7_854d
n16_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- t16_MUX_uxn_opcodes_h_l1194_c7_854d
t16_MUX_uxn_opcodes_h_l1194_c7_854d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond,
t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue,
t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse,
t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_8ae3
n16_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c7_8ae3
t16_MUX_uxn_opcodes_h_l1197_c7_8ae3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond,
t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left,
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right,
BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left,
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right,
BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output);

-- n16_MUX_uxn_opcodes_h_l1201_c7_9523
n16_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left,
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right,
BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output);

-- n16_MUX_uxn_opcodes_h_l1204_c7_6252
n16_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output);

-- n16_MUX_uxn_opcodes_h_l1209_c7_a055
n16_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output);

-- n16_MUX_uxn_opcodes_h_l1212_c7_4bf9
n16_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8
BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left,
BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right,
BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4
BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left,
BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right,
BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249
BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left,
BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right,
BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output);

-- MUX_uxn_opcodes_h_l1216_c32_3c57
MUX_uxn_opcodes_h_l1216_c32_3c57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1216_c32_3c57_cond,
MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue,
MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse,
MUX_uxn_opcodes_h_l1216_c32_3c57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093
BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output);

-- MUX_uxn_opcodes_h_l1222_c24_7b92
MUX_uxn_opcodes_h_l1222_c24_7b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1222_c24_7b92_cond,
MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue,
MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse,
MUX_uxn_opcodes_h_l1222_c24_7b92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22
CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output,
 n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output,
 n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output,
 n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output,
 n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output,
 n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output,
 n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output,
 n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output,
 MUX_uxn_opcodes_h_l1216_c32_3c57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output,
 MUX_uxn_opcodes_h_l1222_c24_7b92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_e650 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_60aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_842d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_cc9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_69f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_5844 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_0d92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_8fae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_968a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_72c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1229_l1176_DUPLICATE_82ad_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_8fae := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1210_c3_8fae;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_968a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_968a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_5844 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_5844;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_60aa := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_60aa;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_cc9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_cc9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_842d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_842d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_69f3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1199_c3_69f3;
     VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_e650 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_e650;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_0d92 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_0d92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right := to_unsigned(8, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := t16;
     -- BIN_OP_AND[uxn_opcodes_h_l1216_c32_c0e4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_left;
     BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output := BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_3172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_72c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_72c6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_d2b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_0e6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_8a57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_213c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_02ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_df27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1201_c11_b663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_left;
     BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output := BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_9113] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_left;
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output := BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c24_0093] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c6_aa1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1204_c11_7c33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1216_c32_c0e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c6_aa1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_9113_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_213c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_d2b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_0e6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1201_c11_b663_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c11_7c33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_8a57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_df27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_3172_return_output;
     VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c24_0093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_02ad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1190_l1213_l1198_l1205_DUPLICATE_f5e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_c17a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1224_l1194_l1218_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_9825_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_4d1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1194_l1189_l1212_l1186_l1209_l1204_l1201_l1197_DUPLICATE_d206_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1224_l1194_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_17e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_72c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_l1218_DUPLICATE_72c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1194_l1218_l1189_l1212_l1186_l1209_l1180_l1204_l1201_l1197_DUPLICATE_e8d0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1218_c7_4d79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output;

     -- MUX[uxn_opcodes_h_l1222_c24_7b92] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1222_c24_7b92_cond <= VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_cond;
     MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue <= VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iftrue;
     MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse <= VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_return_output := MUX_uxn_opcodes_h_l1222_c24_7b92_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1216_c32_b249] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_left;
     BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output := BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1180_c1_969d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_4d79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1198_c3_e4de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_left;
     BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output := BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_12b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_12b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1213_c3_d6c8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_left;
     BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output := BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1216_c32_b249_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1198_c3_e4de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1213_c3_d6c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1191_l1206_DUPLICATE_cc22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue := VAR_MUX_uxn_opcodes_h_l1222_c24_7b92_return_output;
     VAR_printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1180_c1_969d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_12b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;
     -- n16_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_4d79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output := result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_4d79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;

     -- printf_uxn_opcodes_h_l1181_c3_3264[uxn_opcodes_h_l1181_c3_3264] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1181_c3_3264_uxn_opcodes_h_l1181_c3_3264_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- MUX[uxn_opcodes_h_l1216_c32_3c57] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1216_c32_3c57_cond <= VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_cond;
     MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue <= VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iftrue;
     MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse <= VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_return_output := MUX_uxn_opcodes_h_l1216_c32_3c57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_4d79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue := VAR_MUX_uxn_opcodes_h_l1216_c32_3c57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_4d79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_4bf9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- n16_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- t16_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_4bf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     -- t16_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- n16_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1209_c7_a055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_a055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- n16_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c7_6252] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c7_6252_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- t16_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1201_c7_9523] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output := result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1201_c7_9523_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_8ae3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_8ae3_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_854d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_854d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_9608] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;

     -- n16_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1189_c7_9608_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1186_c7_a2f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_a2f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c2_d5c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1229_l1176_DUPLICATE_82ad LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1229_l1176_DUPLICATE_82ad_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c2_d5c2_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1229_l1176_DUPLICATE_82ad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1229_l1176_DUPLICATE_82ad_return_output;
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
