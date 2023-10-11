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
entity sub2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_df1f1450;
architecture arch of sub2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2719_c6_8541]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_2ae5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2719_c2_49d6]
signal t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2720_c3_d605[uxn_opcodes_h_l2720_c3_d605]
signal printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_0855]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2724_c7_8a57]
signal t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_0955]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2727_c7_8396]
signal n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2727_c7_8396]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2727_c7_8396]
signal tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2727_c7_8396]
signal t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_6ee4]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2732_c7_09c5]
signal t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_6516]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2735_c7_b9d6]
signal t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2736_c3_e5bd]
signal BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_74b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2739_c7_e268]
signal n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_e268]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2739_c7_e268]
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_3322]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2742_c7_8761]
signal n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2742_c7_8761]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2742_c7_8761]
signal tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_a8c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2747_c7_0bc8]
signal tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_ce69]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2750_c7_9971]
signal n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c7_9971]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2750_c7_9971]
signal tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2751_c3_de9d]
signal BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2752_c11_5a16]
signal BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2754_c32_c847]
signal BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2754_c32_1980]
signal BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2754_c32_2ef3]
signal MUX_uxn_opcodes_h_l2754_c32_2ef3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_8e45]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2756_c7_5d34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c7_5d34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c7_5d34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2756_c7_5d34]
signal result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2756_c7_5d34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_fc36]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2762_c7_68e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2762_c7_68e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2762_c7_68e3]
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2762_c7_68e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2764_c34_d5fb]
signal CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_c2eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_695a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_695a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output);

-- n16_MUX_uxn_opcodes_h_l2719_c2_49d6
n16_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6
result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6
tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2719_c2_49d6
t16_MUX_uxn_opcodes_h_l2719_c2_49d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond,
t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue,
t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse,
t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

-- printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605
printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605 : entity work.printf_uxn_opcodes_h_l2720_c3_d605_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output);

-- n16_MUX_uxn_opcodes_h_l2724_c7_8a57
n16_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57
result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57
result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57
tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- t16_MUX_uxn_opcodes_h_l2724_c7_8a57
t16_MUX_uxn_opcodes_h_l2724_c7_8a57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond,
t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue,
t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse,
t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output);

-- n16_MUX_uxn_opcodes_h_l2727_c7_8396
n16_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396
result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396
result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2727_c7_8396
tmp16_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- t16_MUX_uxn_opcodes_h_l2727_c7_8396
t16_MUX_uxn_opcodes_h_l2727_c7_8396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond,
t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue,
t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse,
t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output);

-- n16_MUX_uxn_opcodes_h_l2732_c7_09c5
n16_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5
result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5
result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5
tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- t16_MUX_uxn_opcodes_h_l2732_c7_09c5
t16_MUX_uxn_opcodes_h_l2732_c7_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond,
t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue,
t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse,
t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output);

-- n16_MUX_uxn_opcodes_h_l2735_c7_b9d6
n16_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6
tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2735_c7_b9d6
t16_MUX_uxn_opcodes_h_l2735_c7_b9d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond,
t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue,
t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse,
t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd
BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left,
BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right,
BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output);

-- n16_MUX_uxn_opcodes_h_l2739_c7_e268
n16_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2739_c7_e268
tmp16_MUX_uxn_opcodes_h_l2739_c7_e268 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond,
tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue,
tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse,
tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output);

-- n16_MUX_uxn_opcodes_h_l2742_c7_8761
n16_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761
result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761
result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2742_c7_8761
tmp16_MUX_uxn_opcodes_h_l2742_c7_8761 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond,
tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue,
tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse,
tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output);

-- n16_MUX_uxn_opcodes_h_l2747_c7_0bc8
n16_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8
result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8
tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond,
tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output);

-- n16_MUX_uxn_opcodes_h_l2750_c7_9971
n16_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971
result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2750_c7_9971
tmp16_MUX_uxn_opcodes_h_l2750_c7_9971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond,
tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue,
tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse,
tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d
BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left,
BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right,
BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16
BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left,
BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right,
BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847
BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left,
BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right,
BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980
BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left,
BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right,
BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output);

-- MUX_uxn_opcodes_h_l2754_c32_2ef3
MUX_uxn_opcodes_h_l2754_c32_2ef3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2754_c32_2ef3_cond,
MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue,
MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse,
MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34
result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond,
result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34
result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb
CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x,
CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0
CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output,
 n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output,
 n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output,
 n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output,
 n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output,
 n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output,
 n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output,
 n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output,
 n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output,
 n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output,
 MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output,
 CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_684c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_cb62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_8c23 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_68e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_688f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_6313 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_3448 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_0c89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_ef03 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2760_c24_5fe7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_9008 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_b171_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2762_l2750_DUPLICATE_e1ee_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2771_l2715_DUPLICATE_b96c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_3448 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_3448;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_ef03 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_ef03;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_684c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_684c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_8c23 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_8c23;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_68e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_68e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_688f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_688f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_0c89 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_0c89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_6313 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_6313;
     VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_cb62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_cb62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_9008 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_9008;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_8e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_6ee4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_0855] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c6_8541] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2764_c34_d5fb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output := CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_3322] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2754_c32_c847] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_left;
     BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output := BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2762_l2750_DUPLICATE_e1ee LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2762_l2750_DUPLICATE_e1ee_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_a8c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_6516] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_ce69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2760_c24_5fe7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2760_c24_5fe7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_0955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_fc36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_74b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_c2eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2754_c32_c847_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_8541_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_0855_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_0955_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_6ee4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_6516_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_74b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3322_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_a8c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_ce69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_8e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_fc36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_c2eb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2728_l2736_l2743_l2751_DUPLICATE_63e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2760_c24_5fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_a2dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2756_l2727_l2750_l2724_l2747_l2742_DUPLICATE_d3ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2735_l2732_l2756_l2727_l2724_l2747_l2719_l2742_DUPLICATE_cd80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_1133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2762_l2750_DUPLICATE_e1ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2762_l2750_DUPLICATE_e1ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2735_l2762_l2732_l2727_l2750_l2724_l2747_l2719_l2742_DUPLICATE_cab8_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2751_c3_de9d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_left;
     BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output := BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2736_c3_e5bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_left;
     BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output := BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_2ae5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_695a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2754_c32_1980] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_left;
     BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output := BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2764_c24_b171] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_b171_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2764_c34_d5fb_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_695a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2756_c7_5d34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2762_c7_68e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2754_c32_1980_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2736_c3_e5bd_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2751_c3_de9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_b171_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2744_l2729_DUPLICATE_ffe0_return_output;
     VAR_printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_2ae5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_695a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_695a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2762_c7_68e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2762_c7_68e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;

     -- printf_uxn_opcodes_h_l2720_c3_d605[uxn_opcodes_h_l2720_c3_d605] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2720_c3_d605_uxn_opcodes_h_l2720_c3_d605_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2754_c32_2ef3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2754_c32_2ef3_cond <= VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_cond;
     MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue <= VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iftrue;
     MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse <= VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output := MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2752_c11_5a16] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c7_5d34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2762_c7_68e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2752_c11_5a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue := VAR_MUX_uxn_opcodes_h_l2754_c32_2ef3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_68e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2756_c7_5d34] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output := result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;

     -- t16_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2756_c7_5d34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c7_5d34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- n16_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2756_c7_5d34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c7_9971] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2750_c7_9971_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- n16_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_0bc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2747_c7_0bc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     -- n16_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2742_c7_8761] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output := result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- t16_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2742_c7_8761_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_e268] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_e268_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b9d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2735_c7_b9d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- n16_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2732_c7_09c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2732_c7_09c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- n16_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2727_c7_8396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2727_c7_8396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2724_c7_8a57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output := result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2724_c7_8a57_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2719_c2_49d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2771_l2715_DUPLICATE_b96c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2771_l2715_DUPLICATE_b96c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2719_c2_49d6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2771_l2715_DUPLICATE_b96c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2771_l2715_DUPLICATE_b96c_return_output;
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
