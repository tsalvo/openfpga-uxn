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
-- Submodules: 124
entity mul2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_b14a5a36;
architecture arch of mul2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_44a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_420c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1269_c2_90e1]
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1270_c3_5a57[uxn_opcodes_h_l1270_c3_5a57]
signal printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_2384]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c7_4284]
signal t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c7_4284]
signal n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_4284]
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1277_c7_4284]
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_5606]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1281_c7_b14c]
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_5dbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1287_c7_b099]
signal t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1287_c7_b099]
signal n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_b099]
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1287_c7_b099]
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_5b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_d617]
signal t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_d617]
signal n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_d617]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1291_c7_d617]
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1292_c3_41ba]
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_d184]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1296_c7_ea4c]
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_b7fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_c829]
signal n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_c829]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1300_c7_c829]
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_9268]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1306_c7_e9a1]
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_80aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_614d]
signal n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_614d]
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1310_c7_614d]
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1311_c3_ac4e]
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_c416]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1315_c32_58d3]
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1315_c32_250f]
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1315_c32_d2d8]
signal MUX_uxn_opcodes_h_l1315_c32_d2d8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_a09a]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_4f6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_4f6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_4f6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_4f6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_4f6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_e13f]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_c5b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_c5b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_c5b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_c5b1]
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1326_c34_ebaf]
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_cc79]
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_022a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_022a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output);

-- t16_MUX_uxn_opcodes_h_l1269_c2_90e1
t16_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1269_c2_90e1
n16_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1
tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond,
tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

-- printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57
printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57 : entity work.printf_uxn_opcodes_h_l1270_c3_5a57_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c7_4284
t16_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c7_4284
n16_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1277_c7_4284
tmp16_MUX_uxn_opcodes_h_l1277_c7_4284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond,
tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue,
tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse,
tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output);

-- t16_MUX_uxn_opcodes_h_l1281_c7_b14c
t16_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- n16_MUX_uxn_opcodes_h_l1281_c7_b14c
n16_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c
tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond,
tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output);

-- t16_MUX_uxn_opcodes_h_l1287_c7_b099
t16_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- n16_MUX_uxn_opcodes_h_l1287_c7_b099
n16_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1287_c7_b099
tmp16_MUX_uxn_opcodes_h_l1287_c7_b099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond,
tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue,
tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse,
tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_d617
t16_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_d617
n16_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1291_c7_d617
tmp16_MUX_uxn_opcodes_h_l1291_c7_d617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond,
tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue,
tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse,
tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba
BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_ea4c
n16_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c
tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond,
tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_c829
n16_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1300_c7_c829
tmp16_MUX_uxn_opcodes_h_l1300_c7_c829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond,
tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue,
tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse,
tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output);

-- n16_MUX_uxn_opcodes_h_l1306_c7_e9a1
n16_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1
tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_614d
n16_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1310_c7_614d
tmp16_MUX_uxn_opcodes_h_l1310_c7_614d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond,
tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e
BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right,
BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3
BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right,
BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f
BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right,
BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output);

-- MUX_uxn_opcodes_h_l1315_c32_d2d8
MUX_uxn_opcodes_h_l1315_c32_d2d8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1315_c32_d2d8_cond,
MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue,
MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse,
MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf
CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x,
CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output,
 t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output,
 t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output,
 t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output,
 n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output,
 MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5d56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_49d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_b7d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_fb6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_e44f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_0d02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_b0be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_df80 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1312_c3_e335 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_b73b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_3938_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e852 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_fe6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_58f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1265_l1333_DUPLICATE_5276_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_b73b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_b73b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_b0be := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_b0be;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_e44f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_e44f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_fb6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_fb6a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_df80 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_df80;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_0d02 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_0d02;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_49d8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_49d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e852 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_e852;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_b7d2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1285_c3_b7d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5d56 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_5d56;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1269_c6_44a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_58f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_58f4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c11_a09a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_2384] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1315_c32_58d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_left;
     BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output := BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_90e1_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1321_c24_3938] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_3938_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_9268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_5dbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_e13f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_5b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_5606] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_614d_return_output := result.is_stack_read;

     -- CONST_SR_8[uxn_opcodes_h_l1326_c34_ebaf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output := CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_cc79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_d184] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_b7fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_80aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1315_c32_58d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c6_44a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_2384_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_5606_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_5dbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_5b2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_d184_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_b7fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_9268_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_80aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c11_a09a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_e13f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_cc79_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1282_l1292_l1311_l1301_DUPLICATE_9f9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_3938_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1310_l1300_l1306_l1296_DUPLICATE_d5c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1323_l1317_l1310_l1300_l1306_l1296_DUPLICATE_ef08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1269_l1317_l1300_l1306_l1296_DUPLICATE_93a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1328_l1277_l1310_l1300_l1306_l1296_DUPLICATE_3878_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_58f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1323_l1310_DUPLICATE_58f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1281_l1287_l1277_l1323_l1269_l1310_l1300_l1306_l1296_DUPLICATE_b7e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1269_c2_90e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1310_c7_614d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1292_c3_41ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_left;
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output := BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_c5b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1315_c32_250f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_left;
     BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output := BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1326_c24_fe6a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_fe6a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1326_c34_ebaf_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c7_4f6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1311_c3_ac4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_left;
     BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output := BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1269_c1_420c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_022a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_022a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1315_c32_250f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_41ba_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1311_c3_ac4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_fe6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1283_DUPLICATE_dbc6_return_output;
     VAR_printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1269_c1_420c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_022a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_022a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- MUX[uxn_opcodes_h_l1315_c32_d2d8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1315_c32_d2d8_cond <= VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_cond;
     MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue <= VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iftrue;
     MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse <= VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output := MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1312_c11_c416] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_c5b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c7_4f6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_c5b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;

     -- printf_uxn_opcodes_h_l1270_c3_5a57[uxn_opcodes_h_l1270_c3_5a57] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1270_c3_5a57_uxn_opcodes_h_l1270_c3_5a57_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_c5b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1312_c3_e335 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1312_c11_c416_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_MUX_uxn_opcodes_h_l1315_c32_d2d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_c5b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue := VAR_tmp16_uxn_opcodes_h_l1312_c3_e335;
     -- result_stack_value_MUX[uxn_opcodes_h_l1317_c7_4f6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- t16_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c7_4f6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c7_4f6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c7_4f6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_614d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_614d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_e9a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_e9a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_c829] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_c829_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- n16_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_ea4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1296_c7_ea4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_d617] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- n16_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_d617_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_b099] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output := result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b099_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- n16_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_b14c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_b14c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_4284] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output := result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_4284_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c2_90e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1265_l1333_DUPLICATE_5276 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1265_l1333_DUPLICATE_5276_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c2_90e1_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1265_l1333_DUPLICATE_5276_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1265_l1333_DUPLICATE_5276_return_output;
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
