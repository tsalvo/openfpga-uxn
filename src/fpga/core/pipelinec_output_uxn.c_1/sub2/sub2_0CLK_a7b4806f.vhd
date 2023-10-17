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
entity sub2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_a7b4806f;
architecture arch of sub2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_ef65]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_ea76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2653_c2_454b]
signal n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2653_c2_454b]
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_454b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c2_454b]
signal t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2654_c3_7259[uxn_opcodes_h_l2654_c3_7259]
signal printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_62d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2658_c7_a959]
signal n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2658_c7_a959]
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_a959]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2658_c7_a959]
signal t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_627e]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_4adb]
signal t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_081f]
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2666_c7_c151]
signal n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2666_c7_c151]
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_c151]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2666_c7_c151]
signal t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_2c34]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2669_c7_af00]
signal n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2669_c7_af00]
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_af00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2669_c7_af00]
signal t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2670_c3_9a95]
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_05a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_6c6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_7c72]
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2676_c7_416b]
signal n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2676_c7_416b]
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_416b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_8a8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2681_c7_0511]
signal n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2681_c7_0511]
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_0511]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_d524]
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_c0ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2685_c3_f820]
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2686_c11_5919]
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2688_c30_73dd]
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9212]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_e5c4]
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_e5c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_e5c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_e5c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_e5c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2696_c31_c5ad]
signal CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_666b]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_860d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_860d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output);

-- n16_MUX_uxn_opcodes_h_l2653_c2_454b
n16_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2653_c2_454b
tmp16_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c2_454b
t16_MUX_uxn_opcodes_h_l2653_c2_454b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond,
t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

-- printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259
printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259 : entity work.printf_uxn_opcodes_h_l2654_c3_7259_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output);

-- n16_MUX_uxn_opcodes_h_l2658_c7_a959
n16_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2658_c7_a959
tmp16_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- t16_MUX_uxn_opcodes_h_l2658_c7_a959
t16_MUX_uxn_opcodes_h_l2658_c7_a959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond,
t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue,
t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse,
t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output);

-- n16_MUX_uxn_opcodes_h_l2661_c7_4adb
n16_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb
tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_4adb
t16_MUX_uxn_opcodes_h_l2661_c7_4adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output);

-- n16_MUX_uxn_opcodes_h_l2666_c7_c151
n16_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2666_c7_c151
tmp16_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- t16_MUX_uxn_opcodes_h_l2666_c7_c151
t16_MUX_uxn_opcodes_h_l2666_c7_c151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond,
t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue,
t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse,
t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output);

-- n16_MUX_uxn_opcodes_h_l2669_c7_af00
n16_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2669_c7_af00
tmp16_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- t16_MUX_uxn_opcodes_h_l2669_c7_af00
t16_MUX_uxn_opcodes_h_l2669_c7_af00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond,
t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue,
t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse,
t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95
BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left,
BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right,
BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output);

-- n16_MUX_uxn_opcodes_h_l2673_c7_6c6e
n16_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e
tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output);

-- n16_MUX_uxn_opcodes_h_l2676_c7_416b
n16_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2676_c7_416b
tmp16_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2681_c7_0511
n16_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2681_c7_0511
tmp16_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output);

-- n16_MUX_uxn_opcodes_h_l2684_c7_c0ff
n16_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff
tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820
BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left,
BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right,
BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left,
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right,
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd
sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins,
sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x,
sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y,
sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad
CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x,
CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output,
 n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output,
 n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output,
 n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output,
 n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output,
 n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output,
 n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output,
 n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output,
 n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output,
 n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output,
 sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output,
 CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_121c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_9110 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_da38 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_8a58 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_3671 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_7dfd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_751d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_41ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_625d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_881e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_8503 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_e5c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_14f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2703_l2649_DUPLICATE_947b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_7dfd := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_7dfd;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_da38 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_da38;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_41ad := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_41ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_9110 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_9110;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_751d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_751d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_625d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_625d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_8503 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_8503;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_8a58 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_8a58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_3671 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_3671;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_121c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_121c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_666b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_7c72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_left;
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output := BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_62d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2696_c31_c5ad] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output := CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_ef65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2688_c30_73dd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_ins;
     sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_x;
     sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output := sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_05a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_2c34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_d524] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_left;
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output := BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9212] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_081f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_627e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_8a8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_e5c4_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_ef65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_62d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_627e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_081f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_2c34_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_05a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_7c72_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_8a8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_d524_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_666b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2685_l2662_l2677_DUPLICATE_6cb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2653_l2676_l2673_l2669_l2666_DUPLICATE_f4f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2661_l2684_l2658_l2681_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_1dad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_1308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_DUPLICATE_7210_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2658_l2681_l2653_l2676_l2673_l2669_l2666_l2693_DUPLICATE_50b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_73dd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_860d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2696_c21_14f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_14f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_c5ad_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2670_c3_9a95] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_left;
     BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output := BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_860d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2685_c3_f820] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_left;
     BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output := BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_ea76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_9a95_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_f820_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_14f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2663_l2678_DUPLICATE_cd5d_return_output;
     VAR_printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_ea76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_860d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_860d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     -- printf_uxn_opcodes_h_l2654_c3_7259[uxn_opcodes_h_l2654_c3_7259] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2654_c3_7259_uxn_opcodes_h_l2654_c3_7259_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2686_c11_5919] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_e5c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_e5c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- n16_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- t16_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2691_c21_881e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_881e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_5919_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_881e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_c0ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c0ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- n16_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_0511] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output := result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_0511_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- n16_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- t16_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_416b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_416b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_6c6e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_6c6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_af00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output := result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;

     -- n16_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_af00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_c151] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output := result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- n16_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_c151_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_4adb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_4adb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_a959] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output := result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_a959_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_454b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2703_l2649_DUPLICATE_947b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2703_l2649_DUPLICATE_947b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_454b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_454b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2703_l2649_DUPLICATE_947b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2703_l2649_DUPLICATE_947b_return_output;
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
